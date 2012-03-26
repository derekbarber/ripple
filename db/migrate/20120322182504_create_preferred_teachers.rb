class CreatePreferredTeachers < ActiveRecord::Migration
  def change
    create_table :preferred_teachers do |t|
      t.integer :student_instrument_id
      t.integer :teacher_id
      t.integer :order_of_preference

      t.timestamps
    end
  end
end
