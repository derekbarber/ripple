class RemoveNotesFromStudentInstruments < ActiveRecord::Migration
  def up
    remove_column :student_instruments, :notes
  end

  def down
    add_column :student_instruments, :notes, :text
  end
end
