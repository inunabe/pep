class AddColumnToPerformances < ActiveRecord::Migration
  def change
    add_column :performances, :grade_id, :integer
    add_column :performances, :period_id, :integer
  end
end
