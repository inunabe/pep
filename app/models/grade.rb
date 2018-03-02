class Grade < ActiveRecord::Base
  has_many :users
  has_many :questions, through: :grade_questions
  belongs_to :department
  has_many :grade_questions, foreign_key: 'grade_id'
end
