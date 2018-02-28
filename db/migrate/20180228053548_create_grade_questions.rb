class CreateGradeQuestions < ActiveRecord::Migration
  def change
    create_table :grade_questions do |t|
      t.references :grade, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
