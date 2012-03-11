class CreateTeacherInstruments < ActiveRecord::Migration
  def change
    create_table :teacher_instruments do |t|
      t.integer :teacher_id
      t.integer :instrument_id

      t.timestamps
    end
  end
end
