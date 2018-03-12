class RemovePeriodIdFromPeriods < ActiveRecord::Migration
  def change
    remove_column :periods, :period_id, :integer
  end
end
