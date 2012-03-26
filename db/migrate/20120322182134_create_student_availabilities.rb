class CreateStudentAvailabilities < ActiveRecord::Migration
  def change
    create_table :student_availabilities do |t|
      t.integer :student_id
      t.string :day_of_week
      t.time :start_time
      t.time :end_time
      t.boolean :preferred_time
      t.integer :order_of_preference

      t.timestamps
    end
  end
end
