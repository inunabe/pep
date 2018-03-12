class RenameStardColumnToPeriods < ActiveRecord::Migration
  def change
    rename_column :periods, :stard_date, :start_date
  end
end
