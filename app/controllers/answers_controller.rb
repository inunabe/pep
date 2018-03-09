class AnswersController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @questions = @user.grade.questions
    @answer = Answer.new
  end
  # def self_new
  #   @questions = current_user.grade.questions
  #   @answer = Answer.new
  #   @user = User.find(params[:user_id])
  # end

  def create
    user = User.find(params[:answered_user_id])
    questions = user.grade.questions
    question_ids = questions.pluck(:id)
    rates = [params[:rate0],params[:rate1],params[:rate2],params[:rate3],params[:rate4],params[:rate5],params[:rate6],params[:rate7],params[:rate8],params[:rate9],params[:rate10],params[:rate11],params[:rate12],params[:rate13],params[:rate14]]
    question_ids_rates = question_ids.zip(rates)
    question_ids_rates.each do |question_id,rate|
      Answer.create(answering_user_id:current_user.id,question_id:question_id,rate:rate, answered_user_id:params[:answered_user_id])
    end
    if current_user.executive? || current_user.manager?
      redirect_to "/users/#{current_user.id}/subordinate_index",notice:"回答しました"
    else
      redirect_to users_path,notice:"回答しました"
    end
  end

  # def edit
  #   @questions = Question.all
  #   answers = Answer.where(answered_user_id: params[:user_id])

  #   subordinate_answers_ids = []
  #   answers.each do |answer|
  #     subordinate_answers_ids << answer.id
  #   end
  #   @subordinate_answers_ids = subordinate_answers_ids
    # @user = User.find(params[:user_id])
    # @answer = Answer.new(answer_user_id: Answer.find(answer_user.id))
  # end

end
