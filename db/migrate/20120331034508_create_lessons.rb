class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.integer :instrument_id
      t.string :day_of_week
      t.time :start_time
      t.time :end_time
      t.date :start_date
      t.date :end_date
      t.integer :status

      t.timestamps
    end
  end
end
