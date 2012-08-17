class StudentsController < ApplicationController
  before_filter :authorize

  # GET /students
  # GET /students.json
  def index
    @students = Student.all(:order => "family_name")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])

    if (@student.family_id && @student.family_id > 0)
      @family = Family.find(@student.family_id)
    end

    @resound_process = ResoundProcess.find_by_student_id(@student.id)

    @instruments = Instrument.all
    @instrument_names = Instrument.all.collect { |instrument| [instrument.name, instrument.id] }

    @student_instrument = StudentInstrument.new
    @student_availability = StudentAvailability.new
    @preferred_teacher = PreferredTeacher.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new
    if params[:family_id]
      @family = Family.find(params[:family_id])
      @student.family_id = params[:family_id]
    else
      @student.family_id = 0
    end

    @student.custom_contact_details = false

    @resound_process_record = ResoundProcess.new
    @resound_process_record.student_id = @student.id
    @resound_process_record.schedule_assessment = false
    @resound_process_record.schedule_assessment_due = 2.days.from_now
    @resound_process_record.confirm_payment = false
    @resound_process_record.confirm_payment_due = 4.days.from_now
    @resound_process_record.upload_assessment = false
    @resound_process_record.upload_assessment_due = 4.days.from_now
    @resound_process_record.schedule_lessons = false
    @resound_process_record.schedule_lessons_due = 4.days.from_now
    @resound_process_record.welcome_email = false
    @resound_process_record.welcome_email_due = 4.days.from_now
    @resound_process_record.email_assessment = false
    @resound_process_record.email_assessment_due = 4.days.from_now
    @resound_process_record.next_day_followup = false
    @resound_process_record.one_month_followup = false
    @resound_process_record.four_month_followup = false
    @resound_process_record.save

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])

    @resound_process = ResoundProcess.find_by_student_id(@student.id)

    if (@student.family_id && @student.family_id > 0)
      @family = Family.find(@student.family_id)
    end
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    if (params[:family_id] && (params[:family_id] != '0'))
      @family = Family.find(params[:family_id])
      @student.family_id = params[:family_id]
    else
      @student.family_id = 0
    end

    @student.custom_contact_details = false

    @success = @student.save!
    
    logger.debug { "Success: #{@success}"}

    if @success
      @resound_process_record = ResoundProcess.new
      @resound_process_record.student_id = @student.id
      @resound_process_record.schedule_assessment = false
      @resound_process_record.schedule_assessment_due = 2.days.from_now
      @resound_process_record.confirm_payment = false
      @resound_process_record.confirm_payment_due = 4.days.from_now
      @resound_process_record.upload_assessment = false
      @resound_process_record.upload_assessment_due = 4.days.from_now
      @resound_process_record.schedule_lessons = false
      @resound_process_record.schedule_lessons_due = 4.days.from_now
      @resound_process_record.welcome_email = false
      @resound_process_record.welcome_email_due = 4.days.from_now
      @resound_process_record.email_assessment = false
      @resound_process_record.email_assessment_due = 4.days.from_now
      @resound_process_record.next_day_followup = false
      @resound_process_record.one_month_followup = false
      @resound_process_record.four_month_followup = false
      @resound_process_record.save
    end
    
    respond_to do |format|
      if @success
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    if (@student.family_id && @student.family_id > 0)
      @family = Family.find(@student.family_id)
    end

    @resound_process = ResoundProcess.find_by_student_id(@student.id)

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    @resound_process = ResoundProcess.find_by_student_id(@student.id)
    @resound_process.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end
end
