class Department < ActiveRecord::Base
  has_many :grades
end
