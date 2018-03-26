class RemoveColumnFromPerformanceRates < ActiveRecord::Migration
  def change
    remove_column :performance_rates, :grade_id, :integer
    remove_column :performance_rates, :period_id, :integer
  end
end
