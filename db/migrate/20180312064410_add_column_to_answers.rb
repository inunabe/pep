class AddColumnToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :period_id, :integer
  end
end
