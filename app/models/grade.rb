class Grade < ActiveRecord::Base
  has_many :users
  has_many :questions
  belongs_to :department
end
