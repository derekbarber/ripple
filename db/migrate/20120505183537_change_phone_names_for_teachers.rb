class ChangePhoneNamesForTeachers < ActiveRecord::Migration
  def up
    rename_column :teachers, :home_phone, :phone_number1
    rename_column :teachers, :mobile_phone, :phone_number2
    add_column :teachers, :phone_number3, :string
  end

  def down
    rename_column :teachers, :phone_number1, :home_phone
    rename_column :teachers, :phone_number2, :mobile_phone
    remove_column :teachers, :phone_number3
  end

end
