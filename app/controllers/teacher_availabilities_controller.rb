class TeacherAvailabilitiesController < ApplicationController
  # GET /teacher_availabilities
  # GET /teacher_availabilities.json
  def index
    @teacher_availabilities = TeacherAvailability.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teacher_availabilities }
    end
  end

  # GET /teacher_availabilities/1
  # GET /teacher_availabilities/1.json
  def show
    @teacher_availability = TeacherAvailability.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teacher_availability }
    end
  end

  # GET /teacher_availabilities/new
  # GET /teacher_availabilities/new.json
  def new
    @teacher_availability = TeacherAvailability.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teacher_availability }
    end
  end

  # GET /teacher_availabilities/1/edit
  def edit
    @teacher_availability = TeacherAvailability.find(params[:id])
  end

  # POST /teacher_availabilities
  # POST /teacher_availabilities.json
  def create
    @teacher_availability = TeacherAvailability.new(params[:teacher_availability])
    @teacher = Teacher.find(params[:teacher_availability][:teacher_id])

    respond_to do |format|
      if @teacher_availability.save
        format.html { redirect_to @teacher, notice: 'Teacher availability was successfully created.' }
        format.json { render json: @teacher, status: :created, location: @teacher }
      else
        format.html { redirect_to @teacher }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teacher_availabilities/1
  # PUT /teacher_availabilities/1.json
  def update
    @teacher_availability = TeacherAvailability.find(params[:id])
    @teacher = @teacher_availability.teacher_id

    respond_to do |format|
      if @teacher_availability.update_attributes(params[:teacher_availability])
        format.html { redirect_to @teacher_availability, notice: 'Teacher availability was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teacher_availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_availabilities/1
  # DELETE /teacher_availabilities/1.json
  def destroy
    @teacher_availability = TeacherAvailability.find(params[:id])
    @teacher = Teacher.find(@teacher_availability.teacher_id)
    @teacher_availability.destroy

    respond_to do |format|
      format.html { redirect_to @teacher, notice: 'Teacher availability was successfully deleted' }
      format.json { head :no_content }
    end
  end
end
