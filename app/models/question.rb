class Question < ActiveRecord::Base
  has_many :question_alternatives
  has_many :answers
end
