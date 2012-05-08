class ChangePhoneNamesForFamilies < ActiveRecord::Migration
  def up
    rename_column :families, :home_phone, :phone_number1
    rename_column :families, :mobile_phone, :phone_number2
    add_column :families, :phone_number3, :string
    add_column :families, :phone_number4, :string
  end

  def down
    rename_column :families, :phone_number1, :home_phone
    rename_column :families, :phone_number2, :mobile_phone
    remove_column :families, :phone_number3
    remove_column :families, :phone_number4
  end
end
