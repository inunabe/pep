class AnswersController < ApplicationController
  def new
    @questions = Question.all
    @answer = Answer.new
    @user = User.find(params[:user_id])
  end

  def create
    binding.pry
    questions = Question.all
    question_ids = questions.pluck(:id)

    rates = [params[:rate0],params[:rate1],params[:rate2],params[:rate3],params[:rate4],params[:rate5],params[:rate6],params[:rate7],params[:rate8],params[:rate9],params[:rate10],params[:rate11],params[:rate12],params[:rate13],params[:rate14]]
    question_ids_rates = question_ids.zip(rates)
    question_ids_rates.each do |question_id,rate|
      Answer.create(answering_user_id:current_user.id,question_id:question_id,rate:rate, answered_user_id:params[:answered_user_id])
    end


    redirect_to "/users/#{current_user.id}/subordinate_index",notice:"回答しました"
  end

  # private
  # def create_params
  #   params.require(:question_alternative).permit(:text,:rate).merge(question_id: params[:question_id])
  # end

end
