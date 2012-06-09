class ResoundProcessController < ApplicationController
  def next_steps
    @students = Student.all

    @students.each do |student|
      @resound_process = ResoundProcess.find_by_student_id(student.id)

      unless @resound_process
        puts "Student ID Not found: #{student.id}"
        @resound_process_record = ResoundProcess.new
        @resound_process_record.student_id = student.id
        @resound_process_record.save
      end
    end

    
  end

  def follow_up_calls
  end

end
