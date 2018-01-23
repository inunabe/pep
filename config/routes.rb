Rails.application.routes.draw do
  root :to => 'users#index'
  resources :users
  resources :user_sessions

get 'login' => 'user_sessions#new', :as => :login
# ルート名にしようする名前をloginやlogoutにするこの場合なくてもいい
get 'logout' => 'user_sessions#destroy', :as => :logout

end
