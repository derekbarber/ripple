class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :family_name
      t.integer :family_id
      t.date :birthday
      t.string :gender
      t.boolean :custom_contact_details
      t.string :street_address
      t.string :city
      t.string :postal_code
      t.string :home_phone
      t.string :mobile_phone
      t.string :primary_email
      t.string :secondary_email
      t.text :notes
      t.integer :status

      t.timestamps
    end
  end
end
