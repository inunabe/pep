class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :answering_user_id
      t.integer :answered_user_id
      t.integer :question_id
      t.integer :rate
      t.timestamps
    end
  end
end
