class Question < ActiveRecord::Base
  has_many :question_alternatives
  has_many :answers
  accepts_nested_attributes_for :question_alternatives, allow_destroy: true
  has_many :grades, through: :grade_questions
  has_many :grade_questions, foreign_key: 'question_id'
  accepts_nested_attributes_for :grade_questions, allow_destroy: true
end
