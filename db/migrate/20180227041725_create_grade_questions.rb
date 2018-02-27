class CreateGradeQuestions < ActiveRecord::Migration
  def change
    create_table :grade_questions do |t|
      t.integer :grade_id
      t.integer :question_id
      t.timestamps null: false
    end
  end
end
