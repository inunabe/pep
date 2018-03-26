class PerformanceRate < ActiveRecord::Base
  belongs_to :performance
  belongs_to :period
end
