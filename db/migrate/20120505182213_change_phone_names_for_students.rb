class ChangePhoneNamesForStudents < ActiveRecord::Migration
  def up
    rename_column :students, :home_phone, :phone_number1
    rename_column :students, :mobile_phone, :phone_number2
    add_column :students, :phone_number3, :string
    add_column :students, :phone_number4, :string
  end

  def down
    rename_column :students, :phone_number1, :home_phone
    rename_column :students, :phone_number2, :mobile_phone
    remove_column :students, :phone_number3
    remove_column :students, :phone_number4
  end


end
