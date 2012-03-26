class RemoveOrderOfPreferenceFromStudentAvailability < ActiveRecord::Migration
  def up
    remove_column :student_availabilities, :order_of_preference
  end

  def down
    add_column :student_availabilities, :order_of_preference, :integer
  end
end
