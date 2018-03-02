class Question < ActiveRecord::Base
  has_many :question_alternatives
  has_many :answers
  accepts_nested_attributes_for :question_alternatives, allow_destroy: true
  has_many :grade_questions, class_name:
  'GradeQuestion', foreign_key: :question_id
  has_many :grades, through: :grade_questions
  accepts_nested_attributes_for :grade_questions, allow_destroy: true


  validates :text, presence: true
end
