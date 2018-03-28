class PerformancesController < ApplicationController
  def index
    @performances = Performance.all
  end
  def jimu_senmon
    jimu_senmon = Department.where("(name = ?) OR (name = ?)", "事務職", "専門職")
    jimu_senmon_grades = []
    jimu_senmon.each do |js|
      jimu_senmon_grades << js.grades
    end
    jimu_senmon_grades.flatten!
    @performances = []
    jimu_senmon_grades.each do |jimu_senmon_grade|
      @performances << jimu_senmon_grade.performances
    end
    @performances.flatten!
  end
  def kita
    kita = Department.find_by(name: "北日本営業")
      kita_grades = kita.grades
    @performances = []
    kita_grades.each do |kita_grade|
      @performances << kita_grade.performances
    end
    @performances.flatten!
  end
  def tokyo
    tokyo = Department.find_by(name: "北日本営業")
      tokyo_grades = tokyo.grades
    @performances = []
    tokyo_grades.each do |tokyo_grade|
      @performances << tokyo_grade.performances
    end
    @performances.flatten!
  end
  def honsya
    honsya = Department.find_by(name: "北日本営業")
      honsya_grades = honsya.grades
    @performances = []
    honsya_grades.each do |honsya_grade|
      @performances << honsya_grade.performances
    end
    @performances.flatten!
  end
  def shiryo
    shiryo = Department.find_by(name: "北日本営業")
      shiryo_grades = shiryo.grades
    @performances = []
    shiryo_grades.each do |shiryo_grade|
      @performances << shiryo_grade.performances
    end
    @performances.flatten!
  end
  def takasago
    takasago_kojo = Department.where("name like '%高砂%'")
    takasago_kojo_grades = []
    takasago_kojo.each do |t|
      takasago_kojo_grades << t.grades
    end
    takasago_kojo_grades.flatten!
    @performances = []
    takasago_kojo_grades.each do |takasago_kojo_grade|
      @performances << takasago_kojo_grade.performances
    end
    @performances.flatten!
  end
  def ishinomaki
    ishinomaki_kojo = Department.where("name like '%石巻%'")
    ishinomaki_kojo_grades = []
    ishinomaki_kojo.each do |t|
      ishinomaki_kojo_grades << t.grades
    end
    ishinomaki_kojo_grades.flatten!
    @performances = []
    ishinomaki_kojo_grades.each do |ishinomaki_kojo_grade|
      @performances << ishinomaki_kojo_grade.performances
    end
    @performances.flatten!
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
