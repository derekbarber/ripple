class AddThirdEmailToStudents < ActiveRecord::Migration
  def change
    add_column :students, :third_email, :string

  end
end
