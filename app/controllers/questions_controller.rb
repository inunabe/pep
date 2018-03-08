class QuestionsController < ApplicationController

  def new
    redirect_to users_path, alert: 'アクセス権限がありません' unless current_user.admin?
    @question = Question.new
    5.times {
      @question.question_alternatives.build
    }
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to new_question_path, notice:"質問を登録しました"
    else
      render :new
    end
  end

  def index
    @questions = Question.order("id ASC").page(params[:page]).per(15)
  end

  def edit
    redirect_to users_path, alert: 'アクセス権限がありません' unless current_user.admin?
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(update_question_params)
      redirect_to questions_path, notice: "質問を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path, notice: "質問を消去しました"
  end

  private
  def question_params
    params.require(:question).permit(:text,:weight,{question_alternatives_attributes: [:text,:rate]}, {grade_ids: []})
    # params.require(:モデル名).permit(:カラム名)
  end
  def update_question_params
    params.require(:question).permit(:text,:weight,{question_alternatives_attributes: [:text,:rate, :_destroy, :id]}, {grade_ids: []})
  end
end
