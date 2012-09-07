class TeachersController < ApplicationController
  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all(:order => "family_name")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teachers }
    end
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
    @teacher = Teacher.find(params[:id])

    @instrument_names = Instrument.all.collect { |instrument| [instrument.name, instrument.id] }

    @teacher_instrument = TeacherInstrument.new
    @teacher_availability = TeacherAvailability.new

    @teacher_availability.available_surrey = true
    @teacher_availability.available_whiterock = true
    @teacher_availability.available_langley = true
    @teacher_availability.available_aldergrove = true
    @teacher_availability.available_abbotsford = true
    @teacher_availability.available_newwest = true
    @teacher_availability.available_poco = true

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teacher }
    end
  end

  # GET /teachers/new
  # GET /teachers/new.json
  def new
    @teacher = Teacher.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teacher }
    end
  end

  # GET /teachers/1/edit
  def edit
    @teacher = Teacher.find(params[:id])
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(params[:teacher])

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render json: @teacher, status: :created, location: @teacher }
      else
        format.html { render action: "new" }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teachers/1
  # PUT /teachers/1.json
  def update
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      if @teacher.update_attributes(params[:teacher])
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to teachers_url }
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
        teacher = Teacher.build_from_csv(row, status)
        # Save upon valid
        # otherwise collect error records to export
        if teacher.valid?
          teacher.save
        else
          errs << row
        end
      end
      # Export Error file for later upload upon correction
      if errs.any?
        errFile ="errors_#{Date.today.strftime('%d%b%y')}.csv"
        errs.insert(0, Teacher.csv_header)
        errCSV = CSV.generate do |csv|
          errs.each {|row| csv << row}
        end
        send_data errCSV,
          :type => 'text/csv; charset=iso-8859-1; header=present',
          :disposition => "attachment; filename=#{errFile}.csv"
      else
        flash[:notice] = I18n.t('teacher.import.success')
        redirect_to import_url #GET
      end
    end
  end

  def export
    # CRITERIA : to select family records
    #=> Family.active.latest.limit(100)
    teachers = Teacher.limit(10)
    filename ="teachers#{Date.today.strftime('%d%b%y')}"
    csv_data = FasterCSV.generate do |csv|
      csv << Teacher.csv_header
      teachers.each do |t|
        csv << t.to_csv
      end
    end
    send_data csv_data,
      :type => 'text/csv; charset=iso-8859-1; header=present',
      :disposition => "attachment; filename=#{filename}.csv"
  end
end
