class Grade < ActiveRecord::Base
  has_many :users
  has_many :questions, through: :grade_questions
  belongs_to :department
end
