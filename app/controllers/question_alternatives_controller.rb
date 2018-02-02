class QuestionAlternativesController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @question_alternative = QuestionAlternative.new
  end

  def create
    QuestionAlternative.create(create_params)
    redirect_to controller: :questions,action: :index
  end

  private
  def create_params
    params.require(:question_alternative).permit(:text).merge(question_id: params[:question_id])

  end
end
