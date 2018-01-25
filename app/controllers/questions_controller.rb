class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    Question.create(question_params)
    redirect_to action: :new
  end

  def index
    @questions = Question.all
  end

  private
  def question_params
    params.require(:question).permit(:text)
    # params.require(:モデル名).permit(:カラム名)
  end
end
