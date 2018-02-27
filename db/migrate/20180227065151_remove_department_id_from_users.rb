class RemoveDepartmentIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :department_id, :integer
  end
end
