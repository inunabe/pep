class AddColumnToPeriods < ActiveRecord::Migration
  def change
    add_column :periods, :period_id, :integer
  end
end
