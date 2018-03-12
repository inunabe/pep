class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :title
      t.date :stard_date
      t.date :finish_date
      t.timestamps null: false
    end
  end
end
