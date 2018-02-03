class AnswersController < ApplicationController
  def new
    @questions = Question.all
    @answer = Answer.new
  end
end
