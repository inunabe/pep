class Period < ActiveRecord::Base
  has_many :answers
  has_many :performance_rates
end
