class QuestionsController < ApplicationController

  def new
    redirect_to users_path, alert: 'アクセス権限がありません' unless current_user.admin?
    @question = Question.new
    5.times {
      @question.question_alternatives.build
    }
  end

  def create
    question = Question.create(question_params)
    grade_params[:grade_ids].each do |grade_id|
      question.grade_questions.create(grade_id: grade_id) unless grade_id.empty?
      # questionがgrade_questionとアソシエーションを組んでいるので、自動的に中間テーブルである
      # grade_questionsテーブルにquestion_idが保存される。
    end
    redirect_to new_question_path, notice:"質問を登録しました"
  end

  def index
    @questions = Question.all
  end

  def edit
    redirect_to users_path, alert: 'アクセス権限がありません' unless current_user.admin?
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    # grade_params[:grade_ids].each do |grade_id|
    #   @question.grade_questions.update(grade_id: grade_id) unless grade_id.empty?
    # end
    redirect_to questions_path, notice: "質問を編集しました"
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path, notice: "質問を消去しました"
  end

  private
  def question_params
    params.require(:question).permit(:text,:weight,question_alternatives_attributes: [:text,:rate])
    # params.require(:モデル名).permit(:カラム名)
  end
  def grade_params
    params.require(:grade).permit(grade_ids:[])
  end
end
