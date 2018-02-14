class UsersController < ApplicationController
  skip_before_action :require_login, only: :new
  before_action :set_user, only: [:show, :edit, :update,]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    redirect_to users_path, alert: 'アクセス権限がありません' unless current_user.id == @user.id ||  current_user.id == @user.superior_user.id || @user.admin?
    if current_user.nomal?
      @answers = current_user.answered_answer
    elsif current_user.manager?
      @answers = current_user.answering_answers.where(answered_user_id:params[:id])
      @subordinate = User.find(params[:id])
    elsif current_user.executive?
      @answers = Answer.where(answered_user_id:params[:id])
      @subordinate = User.find(params[:id])
    elsif current_user.admin?
      @answers = Answer.where(answered_user_id:params[:id])
      @answered_user = User.find(params[:id])
      @answering_user = @answered_user.superior_user
    end
    @answers.each do |answer|
      @question_alternative = QuestionAlternative.find_by(question_id: answer.question_id,rate: answer.rate)
    end
  end

  def mypage
    @user = User.find(params[:id])
    redirect_to users_path, alert: 'アクセス権限がありません' unless current_user.id == @user.id ||  current_user.id == @user.superior_user.id || @user.admin?
    @answers = current_user.answered_answer
    @answers.each do |answer|
      @question_alternative = QuestionAlternative.find_by(question_id: answer.question_id,rate: answer.rate)
    end
  end

# 部下一覧を表示させる
  def subordinate_index
    @subordinates = current_user.subordinate_users
  end

  # GET /users/new
  def new
    redirect_to users_path, alert: 'アクセス権限がありません' unless current_user.admin?
    set_superiors
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    redirect_to users_path, alert: 'アクセス権限がありません' unless current_user.id == @user.id ||  current_user.id == @user.superior_user.id || @user.admin?
    set_superiors
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to new_user_session_path, notice: 'ユーザー作成しました' }
        format.json { render :show, status: :created, location: @user }
      else
        set_superiors
        format.html { render :new}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to ({action:'index'}), notice: 'ユーザー情報を編集しました' }
        format.json { render :show, status: :ok, location: @user }
      else
        set_superiors
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'ユーザーを削除しました' }
      format.json { head :no_content }
    end
  end

  private
    def set_superiors
      users = User.all
      managers = users.manager
      executives = users.executive
      managers.push(executives)
      @superiors = managers.flatten
    end
    # Use callbacks to share common setup or constraints between actions.
    # 詳細リンクに必要
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # paramsハッシュ構造が二重になっている（paramsというハッシュの中にuserというバリューがあって、user自身もバリューを持っているparams=>{user=>{:email,:password,:name}}）
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :role, :superior_id)
    end
end
