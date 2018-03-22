class AnswersController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @questions = @user.grade.questions
    @answer = Answer.new
    @period_id = params[:period_id]
    @self_answers = Answer.where(answering_user_id: @user.id, answered_user_id: @user.id, period_id: @period_id)
  end

  def select_period
  end
  # 回答画面か閲覧画面か振り分けるアクション
  def switch_period
    @user = User.find(params[:answered_user_id])
    @period_id = params[:period][:title]
    # answerテーブルから今ログイン中の上司が部下へ下した該当期のanswerを絞り出す
    @this_period_answer = Answer.where(answering_user_id: current_user.id, answered_user_id: @user.id, period_id: @period_id)
    if current_user.executive? && @this_period_answer.present?
      redirect_to "/users/#{@user.id}/#{params[:period][:title]}"
    elsif current_user.manager? && @this_period_answer.present?
      redirect_to "/users/#{@user.id}/#{params[:period][:title]}"
    elsif current_user.normal? && @this_period_answer.present?
      redirect_to "/users/#{@user.id}/#{params[:period][:title]}"
    elsif current_user.admin? && @this_period_answer.present?
      redirect_to "/users/#{@user.id}/#{params[:period][:title]}"
    elsif current_user.admin? && current_user.id != @user.id && @this_period_answer.empty?
      redirect_to users_path, alert: "まだ回答されていません"
    else
      redirect_to "/answers/new/#{params[:answered_user_id]}/#{@period_id}"
    end
  end

  def create
    user = User.find(params[:answered_user_id])
    questions = user.grade.questions
    question_ids = questions.pluck(:id)
    rates = [params[:rate0],params[:rate1],params[:rate2],params[:rate3],params[:rate4],params[:rate5],params[:rate6],params[:rate7],params[:rate8],params[:rate9],params[:rate10],params[:rate11],params[:rate12],params[:rate13],params[:rate14]]
    question_ids_rates = question_ids.zip(rates)
    question_ids_rates.each do |question_id,rate|
      Answer.create(answering_user_id:current_user.id,question_id:question_id,rate:rate, answered_user_id:params[:answered_user_id],period_id:params[:period_id])
    end
    if current_user.executive? || current_user.manager?
      redirect_to "/users/#{current_user.id}/subordinate_index",notice:"回答しました"
    else
      redirect_to users_path,notice:"回答しました"
    end
  end

  def edit
    @user = User.find(params[:answered_user_id])
    @answer = Answer.find(params[:answer_id])
    @question = @answer.question
  end
  def update
    user = User.find(params[:answered_user_id])
    @answer = Answer.find(params[:id])
    @answer.update(update_params)
    redirect_to user_path(user),notice:"評価編集しました"
  end

  private
  def update_params
    params.permit(:rate)
  end
end
