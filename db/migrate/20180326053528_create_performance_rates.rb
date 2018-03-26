class CreatePerformanceRates < ActiveRecord::Migration
  def change
    create_table :performance_rates do |t|
      t.integer :rate
      t.integer :grade_id
      t.integer :period_id
      t.integer :performance_id
      t.timestamps null: false
    end
  end
end
