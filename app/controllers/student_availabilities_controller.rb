class StudentAvailabilitiesController < ApplicationController
  # GET /student_availabilities
  # GET /student_availabilities.json
  def index
    @student_availabilities = StudentAvailability.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_availabilities }
    end
  end

  # GET /student_availabilities/1
  # GET /student_availabilities/1.json
  def show
    @student_availability = StudentAvailability.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_availability }
    end
  end

  # GET /student_availabilities/new
  # GET /student_availabilities/new.json
  def new
    @student_availability = StudentAvailability.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_availability }
    end
  end

  # GET /student_availabilities/1/edit
  def edit
    @student_availability = StudentAvailability.find(params[:id])
  end

  # POST /student_availabilities
  # POST /student_availabilities.json
  def create
    @student_availability = StudentAvailability.new(params[:student_availability])

    @student = Student.find(params[:student_availability][:student_id])

    respond_to do |format|
      if @student_availability.save
        format.html { redirect_to @student, notice: 'Student availability was successfully created.' }
        format.json { render json: @student_availability, status: :created, location: @student_availability }
      else
        format.html { render action: "new" }
        format.json { render json: @student_availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_availabilities/1
  # PUT /student_availabilities/1.json
  def update
    @student_availability = StudentAvailability.find(params[:id])

    respond_to do |format|
      if @student_availability.update_attributes(params[:student_availability])
        format.html { redirect_to @student_availability, notice: 'Student availability was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_availabilities/1
  # DELETE /student_availabilities/1.json
  def destroy
    @student_availability = StudentAvailability.find(params[:id])
    @student_availability.destroy

    respond_to do |format|
      format.html { redirect_to student_availabilities_url }
      format.json { head :no_content }
    end
  end
end
