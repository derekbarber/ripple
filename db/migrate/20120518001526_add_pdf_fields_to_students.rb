class AddPdfFieldsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :assessment_form, :string
    add_column :students, :bank_authorization, :string
  end
end
