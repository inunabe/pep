class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.string :item
      t.integer :weight
      t.timestamps null: false
    end
  end
end
