class PerformancesController < ApplicationController
  def index
    @performances = Performance.all
  end
  def new
    @performance = Performance.new
  end
  def create
    @performance = Performance.new(performance_params)
      if @performance.save
        redirect_to new_performance_path, notice:"項目を登録しました"
      else
        render :new
    end
  end
  def edit
    @performance = Performance.find(params[:id])
  end
  def update
    @performance = Performance.find(params[:id])
    if @performance.update(performance_params)
      redirect_to performances_path, notice: "業績評価項目を編集しました"
    else
      render :edit
    end
  end
  def destroy
    @performance = Performance.find(params[:id])
    @performance.destroy
    redirect_to performances_path, notice: "業績評価項目を消去しました"
  end
  private
    def performance_params
      params.require(:performance).permit(:item,:weight,:grade_id)
    end
end
