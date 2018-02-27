class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :department_id
      t.integer :rank, default: 1
      t.timestamps null: false
    end
  end
end
