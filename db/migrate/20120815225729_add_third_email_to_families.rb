class AddThirdEmailToFamilies < ActiveRecord::Migration
  def change
    add_column :families, :third_email, :string

  end
end
