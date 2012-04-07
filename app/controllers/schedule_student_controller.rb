class ScheduleStudentController < ApplicationController
  def view_pending
    #@students = Student.all( :include => :lessons, :conditions => "lessons.student_id IS NULL")

    @student_instruments = StudentInstrument.all(:include => :lessons, :conditions => "lessons.student_instrument_id IS NULL")
  end

  def schedule_pending
    @student_instrument = StudentInstrument.find(params[:id])
    @lesson = Lesson.new
  end

  def view_tenative
    @lessons = Lesson.all(:conditions => "lessons.status IS 0")
  end

  def confirm_tenative
    @lesson = Lesson.find(params[:id])
    @lesson.status = 1
    @lesson.save

    redirect_to view_tenative_path, notice: 'Lesson was successfully confirmed'
  end

  def view_schedule
    @lessons = Lesson.all(:conditions => "lessons.status IS 1")
  end

  def view_teacher_schedule
    if params[:teacher_id]
      @teacher = Teacher.find(params[:teacher_id])
      @lessons = Lesson.all(:conditions => ["status IS 1 and teacher_id = ?", @teacher.id])
    end

    @teachers = Teacher.all
  end


end
