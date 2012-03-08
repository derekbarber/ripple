class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :family_name
      t.string :gender
      t.string :email
      t.string :street_address
      t.string :city
      t.string :postal_code
      t.string :home_phone
      t.string :mobile_phone
      t.string :secondary_email
      t.text :notes
      t.integer :status

      t.timestamps
    end
  end
end
