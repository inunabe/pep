class Performance < ActiveRecord::Base
  belongs_to :grade
  has_many :performance_rates
end
