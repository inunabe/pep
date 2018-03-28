class PerformanceRatesController < ApplicationController
  def new
    @performance_rate = PerformanceRate.new
  end
end
