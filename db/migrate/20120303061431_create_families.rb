class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :family_name
      t.string :parent_names
      t.string :street_address
      t.string :postal_code
      t.string :city
      t.string :primary_email
      t.string :secondary_email
      t.string :home_phone
      t.string :mobile_phone
      t.text :notes
      t.integer :status

      t.timestamps
    end
  end
end
