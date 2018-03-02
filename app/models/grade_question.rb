class GradeQuestion < ActiveRecord::Base
  belongs_to :grade
  belongs_to :question
  # accepts_nested_attributes_for :grade
end
