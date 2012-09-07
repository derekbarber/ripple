class FamiliesController < ApplicationController
  before_filter :authorize

  # GET /families
  # GET /families.json
  def index
    @families = Family.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: FamiliesDatatable.new(view_context) }
    end
  end

  # GET /families/1
  # GET /families/1.json
  def show
    @family = Family.find(params[:id])

    #@students = @family.students.build

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @family }
    end
  end

  # GET /families/new
  # GET /families/new.json
  def new
    @family = Family.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @family }
    end
  end

  # GET /families/1/edit
  def edit
    @family = Family.find(params[:id])
  end

  # POST /families
  # POST /families.json
  def create
    @family = Family.new(params[:family])

    respond_to do |format|
      if @family.save
        format.html { redirect_to @family, notice: 'Family was successfully created.' }
        format.json { render json: @family, status: :created, location: @family }
      else
        format.html { render action: "new" }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /families/1
  # PUT /families/1.json
  def update
    @family = Family.find(params[:id])

    respond_to do |format|
      if @family.update_attributes(params[:family])
        format.html { redirect_to @family, notice: 'Family was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /families/1
  # DELETE /families/1.json
  def destroy
    @family = Family.find(params[:id])
    @family.destroy

    respond_to do |format|
      format.html { redirect_to families_url }
      format.json { head :no_content }
    end
  end

  def import
    
    require 'csv'
    
    if request.post? && params[:file].present?
      infile = params[:file].read
      status = params[:status]
      n, errs = 0, []

      CSV.parse(infile) do |row|
        n += 1
        # SKIP: header i.e. first row OR blank row
        next if n == 1 or row.join.blank?
        # build_from_csv method will map customer attributes &
        # build new customer record
        family = Family.build_from_csv(row, status)
        # Save upon valid
        # otherwise collect error records to export
        p family
        if family.valid?
          family.save
        else
          errs << row
        end
      end
      # Export Error file for later upload upon correction
      if errs.any?
        errFile ="errors_#{Date.today.strftime('%d%b%y')}.csv"
        errs.insert(0, Family.csv_header)
        errCSV = CSV.generate do |csv|
          errs.each {|row| csv << row}
        end
        send_data errCSV,
          :type => 'text/csv; charset=iso-8859-1; header=present',
          :disposition => "attachment; filename=#{errFile}.csv"
      else
        flash[:notice] = I18n.t('family.import.success')
        redirect_to import_url #GET
      end
    end
  end

  def export
    # CRITERIA : to select family records
    #=> Family.active.latest.limit(100)
    families = Family.limit(10)
    filename ="families_#{Date.today.strftime('%d%b%y')}"
    csv_data = FasterCSV.generate do |csv|
      csv << Family.csv_header
      families.each do |f|
        csv << f.to_csv
      end
    end
    send_data csv_data,
      :type => 'text/csv; charset=iso-8859-1; header=present',
      :disposition => "attachment; filename=#{filename}.csv"
  end


end
