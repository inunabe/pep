class RenameGradeIdColumnToPerformances < ActiveRecord::Migration
  def change
    rename_column :performances, :grade_id, :department_id
  end
end
