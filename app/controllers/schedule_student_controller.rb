class ScheduleStudentController < ApplicationController
  def view_pending
    #@students = Student.all( :include => :lessons, :conditions => "lessons.student_id IS NULL")

    @student_instruments = StudentInstrument.all(:include => :lessons, :conditions => "lessons.student_instrument_id IS NULL")
  end

  def schedule_pending
    @student_instrument = StudentInstrument.find(params[:id])
    @lesson = Lesson.new
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


end
