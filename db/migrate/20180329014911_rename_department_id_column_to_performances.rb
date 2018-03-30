class RenameDepartmentIdColumnToPerformances < ActiveRecord::Migration
  def change
    rename_column :performances, :department_id, :grade_id
  end
end
