class GradeQuestion < ActiveRecord::Base
  belongs_to :grade
  belongs_to :question
end
