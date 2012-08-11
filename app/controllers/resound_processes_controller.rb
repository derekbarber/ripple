class ResoundProcessesController < ApplicationController

  can_edit_on_the_spot

  # GET /resound_process
  # GET /resound_process.json
  def index
    @resound_process = ResoundProcess.all
  end

  def show
    @resound_process = ResoundProcess.find(params[:id])
  end

  def new
    @resound_process = ResoundProcess.new
  end

  def create
    @resound_process = ResoundProcess.new(params[:resound_process])
    if @resound_process.save
      redirect_to @resound_process, notice: "Successfully created new process entry."
    else
      render :new
    end
  end

  def edit
    @resound_process = ResoundProcess.find(params[:id])
  end

  # PUT /resound_process/1
  # PUT /resound_process/1.json
  def update
    @resound_process = ResoundProcess.find(params[:id])

    success = @resound_process.update_attributes(params[:resound_process])

    @schedule_assessment = ResoundProcess.where(:schedule_assessment => false)

    @confirm_payment = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => false)

    @upload_assessment = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
                                              :upload_assessment => false)

    @schedule_lessons = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
                                          :upload_assessment => true, :schedule_lessons => false)


    @welcome_email = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
                                          :upload_assessment => true, :schedule_lessons => true,
                                          :welcome_email => false)

    @email_assessment = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
                                              :upload_assessment => true, :schedule_lessons => true,
                                              :welcome_email => true, :email_assessment => false)

    @next_day_followup = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
                                              :upload_assessment => true, :schedule_lessons => true,
                                              :welcome_email => true, :email_assessment => true,
                                              :next_day_followup => false)

    @one_month_followup = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
                                              :upload_assessment => true, :schedule_lessons => true,
                                              :welcome_email => true, :email_assessment => true,
                                              :next_day_followup => true, :one_month_followup => false)

    @four_month_followup = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
                                                :upload_assessment => true, :schedule_lessons => true,
                                                :welcome_email => true, :email_assessment => true,
                                                :next_day_followup => true, :one_month_followup => true,
                                                :four_month_followup => false)

    respond_to do |format|
      if success
        format.html # { redirect_to(@resound_process, :notice => 'Value was successfully updated.') }
        format.js
        format.json { render json: @resound_process, status: :updated }
      else
        format.html #{ render :action => "edit" }
        format.json #{ render json: @resound_process.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resound_process = ResoundProcess.find(params[:id])
    @resound_process.destroy
    redirect_to users_url, notice: "Successfully destroyed Resound Process."
  end

  def next_steps
    @students = Student.all

    @students.each do |student|
      @resound_process = ResoundProcess.find_by_student_id(student.id)

      unless @resound_process
        puts "Student ID Not found: #{student.id}"
        @resound_process_record = ResoundProcess.new
        @resound_process_record.student_id = student.id
        @resound_process_record.schedule_assessment = false
        @resound_process_record.confirm_payment = false
        @resound_process_record.upload_assessment = false
        @resound_process_record.schedule_lessons = false
        @resound_process_record.welcome_email = false
        @resound_process_record.email_assessment = false
        @resound_process_record.next_day_followup = false
        @resound_process_record.one_month_followup = false
        @resound_process_record.four_month_followup = false
        @resound_process_record.save
      end
    end

    #@schedule_assessment = Student.all(:include => :resound_process, :conditions => "resound_processes.schedule_assessment = 0 OR resound_processes.schedule_assessment IS NULL")

    @schedule_assessment = ResoundProcess.where(:schedule_assessment => false)

    @confirm_payment = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => false)

    @upload_assessment = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
                                              :upload_assessment => false)

    @schedule_lessons = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
                                              :upload_assessment => true, :schedule_lessons => false)


    @welcome_email = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
                                          :upload_assessment => true, :schedule_lessons => true,
                                          :welcome_email => false)

    @email_assessment = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
                                              :upload_assessment => true, :schedule_lessons => true,
                                              :welcome_email => true, :email_assessment => false)

    @next_day_followup = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
                                              :upload_assessment => true, :schedule_lessons => true,
                                              :welcome_email => true, :email_assessment => true,
                                              :next_day_followup => false)

    @one_month_followup = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
                                              :upload_assessment => true, :schedule_lessons => true,
                                              :welcome_email => true, :email_assessment => true,
                                              :next_day_followup => true, :one_month_followup => false)

    @four_month_followup = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
                                                :upload_assessment => true, :schedule_lessons => true,
                                                :welcome_email => true, :email_assessment => true,
                                                :next_day_followup => true, :one_month_followup => true,
                                                :four_month_followup => false)

  end

end
