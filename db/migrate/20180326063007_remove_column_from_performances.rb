class RemoveColumnFromPerformances < ActiveRecord::Migration
  def change
    remove_column :performances, :period_id, :integer
  end
end
