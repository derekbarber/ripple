class AddLessonDurationToStudentInstruments < ActiveRecord::Migration
  def up
    add_column :student_instruments, :lesson_duration, :integer
  end

  def down
    remove_column :student_instruments, :lesson_duration
  end

end
