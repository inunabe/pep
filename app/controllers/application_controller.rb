class ApplicationController < ActionController::Base
  before_action :require_login #ログイン必須
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  private
  def not_authenticated
    redirect_to login_path, alert: "ログインしてください"
  end
end
