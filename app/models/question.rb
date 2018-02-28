class Question < ActiveRecord::Base
  has_many :question_alternatives
  has_many :answers
  accepts_nested_attributes_for :question_alternatives
  has_many :grades, through: :grade_questions
end
