class PreferredTeachersController < ApplicationController
  # GET /preferred_teachers
  # GET /preferred_teachers.json
  def index
    @preferred_teachers = PreferredTeacher.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @preferred_teachers }
    end
  end

  # GET /preferred_teachers/1
  # GET /preferred_teachers/1.json
  def show
    @preferred_teacher = PreferredTeacher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @preferred_teacher }
    end
  end

  # GET /preferred_teachers/new
  # GET /preferred_teachers/new.json
  def new
    @preferred_teacher = PreferredTeacher.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @preferred_teacher }
    end
  end

  # GET /preferred_teachers/1/edit
  def edit
    @preferred_teacher = PreferredTeacher.find(params[:id])
  end

  # POST /preferred_teachers
  # POST /preferred_teachers.json
  def create
    @preferred_teacher = PreferredTeacher.new(params[:preferred_teacher])
    @student_instrument = StudentInstrument.find(params[:preferred_teacher][:student_instrument_id])
    @student = Student.find(@student_instrument.student_id)

    respond_to do |format|
      if @preferred_teacher.save
        format.html { redirect_to @student, notice: 'Preferred teacher was successfully added.' }
        format.json { render json: @preferred_teacher, status: :created, location: @preferred_teacher }
      else
        format.html { render action: "new" }
        format.json { render json: @preferred_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /preferred_teachers/1
  # PUT /preferred_teachers/1.json
  def update
    @preferred_teacher = PreferredTeacher.find(params[:id])
    @student_instrument = StudentInstrument.find(@preferred_teacher.student_instrument_id)
    @student = Student.find(@student_instrument.student_id)

    respond_to do |format|
      if @preferred_teacher.update_attributes(params[:preferred_teacher])
        format.html { redirect_to @student, notice: 'Preferred teacher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @preferred_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preferred_teachers/1
  # DELETE /preferred_teachers/1.json
  def destroy
    @preferred_teacher = PreferredTeacher.find(params[:id])
    @preferred_teacher.destroy

    respond_to do |format|
      format.html { redirect_to preferred_teachers_url }
      format.json { head :no_content }
    end
  end
end
