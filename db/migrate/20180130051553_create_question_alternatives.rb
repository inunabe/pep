class CreateQuestionAlternatives < ActiveRecord::Migration
  def change
    create_table :question_alternatives do |t|
      t.text :text
      t.integer :question_id
      t.timestamps
    end
  end
end
