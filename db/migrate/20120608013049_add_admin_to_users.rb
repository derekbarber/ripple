class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :teacher_id, :integer
    add_column :users, :status, :boolean
  end
end
