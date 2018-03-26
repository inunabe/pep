class AddColumnToPerformanceRates < ActiveRecord::Migration
  def change
    add_column :performance_rates, :period_id, :integer
  end
end
