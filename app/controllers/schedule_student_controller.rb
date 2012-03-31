class ScheduleStudentController < ApplicationController
  def pending
    #@students = Student.all( :include => :lessons, :conditions => "lessons.student_id IS NULL")

    @student_instruments = StudentInstrument.all(:include => :lessons, :conditions => "lessons.student_instrument_id IS NULL")

    @lesson = Lesson.new
  end
end
