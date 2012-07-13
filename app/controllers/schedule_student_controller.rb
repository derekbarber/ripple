class ScheduleStudentController < ApplicationController

  can_edit_on_the_spot

  def view_pending
    #@students = Student.all( :include => :lessons, :conditions => "lessons.student_id IS NULL")

    @student_instruments = StudentInstrument.all(:include => :lessons, :conditions => "lessons.student_instrument_id IS NULL")
  end

  def schedule_pending
    @student_instrument = StudentInstrument.find(params[:id])
    @lesson = Lesson.new
  end

  def schedule_multiple

  end


  def view_tentative
    @lessons = Lesson.all(:conditions => "status = 0")
  end

  def confirm_tentative
    @lesson = Lesson.find(params[:id])
    @lesson.status = 1
    @lesson.save

    redirect_to view_tentative_path, notice: 'Lesson was successfully confirmed'
  end

  def view_schedule
    @lessons = Lesson.all(:conditions => "status = 1")
  end

  def view_teacher_schedule
    if params[:teacher_id]
      @teacher = Teacher.find(params[:teacher_id])
      @lessons = Lesson.all(:conditions => ["status = 1 and teacher_id = ?", @teacher.id])
    end

    @teachers = Teacher.all
  end

  def next_steps
    @students = Student.all

    @students.each do |student|
      @resound_process = ResoundProcess.find_by_student_id(student.id)

      unless @resound_process
        #puts "Student ID Not found: #{student.id}"
        @resound_process_record = ResoundProcess.new
        @resound_process_record.student_id = student.id
        @resound_process_record.save
      end
    end

    #@schedule_assessment = Student.all(:include => :resound_process, :conditions => "resound_processes.schedule_assessment = 0 OR resound_processes.schedule_assessment IS NULL")
    #@schedule_assessment = ResoundProcess.where(:schedule_assessment => false)
    @schedule_assessment = ResoundProcess.all(:conditions => "resound_processes.schedule_assessment = '0' OR resound_processes.schedule_assessment IS NULL")

    @confirm_payment = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => false)

    @upload_assessment = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
                                              :upload_assessment => false)

    #@schedule_lessons = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
    #                                          :upload_assessment => true, :schedule_lessons => false)


    #@welcome_email = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
    #                                      :upload_assessment => true, :schedule_lessons => true,
    #                                      :welcome_email => false)

    #@email_assessment = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
    #                                          :upload_assessment => true, :schedule_lessons => true,
    #                                          :welcome_email => true, :email_assessment => false)

    #@next_day_followup = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
    #                                          :upload_assessment => true, :schedule_lessons => true,
    #                                          :welcome_email => true, :email_assessment => true,
    #                                          :next_day_followup => false)

    #@one_month_followup = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
    #                                          :upload_assessment => true, :schedule_lessons => true,
    #                                          :welcome_email => true, :email_assessment => true,
    #                                          :next_day_followup => true, :one_month_followup => false)

    #@four_month_followup = ResoundProcess.where(:schedule_assessment => true, :confirm_payment => true,
    #                                            :upload_assessment => true, :schedule_lessons => true,
    #                                            :welcome_email => true, :email_assessment => true,
    #                                            :next_day_followup => true, :one_month_followup => true,
    #                                            :four_month_followup => false)

  end


  def follow_up_calls
  end

end
