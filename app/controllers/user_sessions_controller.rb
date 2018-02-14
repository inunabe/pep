class UserSessionsController < ApplicationController

  skip_before_action :require_login, except: [:destroy]
  # ログインしないとdestroyできない
  def index
  end
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(users_path, notice: "#{current_user.name}\sさんでログインしました")
    else
      redirect_to login_path, alert: "ログインに失敗しました"
      #他のアクションのテンプレートを表示
      #「new.html.erb」を表示する
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'ログアウトしました')
  end

end
