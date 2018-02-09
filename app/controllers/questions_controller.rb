class QuestionsController < ApplicationController

  def new
    @question = Question.new
    5.times {
      @question.question_alternatives.build
    }
  end

  def create
    Question.create(question_params)
    redirect_to action: :new
  end

  def index
    @questions = Question.all
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to questions_path, notice: "質問項目を編集しました"
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path, notice: "質問項目を消去しました"
  end

  private
  def question_params
    params.require(:question).permit(:text,question_alternatives_attributes: [:text,:rate])
    # params.require(:モデル名).permit(:カラム名)
  end
end
