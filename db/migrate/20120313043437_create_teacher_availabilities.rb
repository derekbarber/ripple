class CreateTeacherAvailabilities < ActiveRecord::Migration
  def change
    create_table :teacher_availabilities do |t|
      t.integer :teacher_id
      t.string :day_of_week
      t.time :start_time
      t.time :end_time
      t.boolean :custom_start_location
      t.string :start_address
      t.string :start_city
      t.string :start_postal_code
      t.boolean :custom_end_location
      t.string :end_address
      t.string :end_city
      t.string :end_postal_code
      t.boolean :available_surrey
      t.boolean :available_whiterock
      t.boolean :available_langley
      t.boolean :available_aldergrove
      t.boolean :available_abbotsford
      t.boolean :available_newwest
      t.boolean :available_poco

      t.timestamps
    end
  end
end
