class AddStudentInstrumentIdToLessons < ActiveRecord::Migration
  def up
    add_column :lessons, :student_instrument_id, :integer
  end

  def down
    remove_column :lessons, :student_instrument_id
  end

end
