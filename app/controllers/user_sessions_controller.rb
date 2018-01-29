class UserSessionsController < ApplicationController

  skip_before_action :require_login, except: [:destroy]
  # ログインしないとdestroyできない
  def index
    redirect_to "/"

  end
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(users_path, notice: 'ログインしました')
    else
      # flash.now[:alert] = 'ログインできませんでした'
      # render action: 'new'
      redirect_to login_path, alert: "ログインに失敗しました"
      #他のアクションのテンプレートを表示
      #「new.html.erb」を表示する
    end
  end

  def destroy
    logout
    redirect_to(users_path, notice: 'ログアウトしました')
  end

end
