class QuestionAlternativesController < ApplicationController
  def new
    @question_alternative = QuestionAlternative.new
  end

  def create

    redirect_to controller: :questions,action: :index
  end
end
