Rails.application.routes.draw do
  root  'users#index'
  # root  'user_sessions#new'
  resources :users
  resources :user_sessions

get 'login' => 'user_sessions#new', :as => :login
# ルート名にしようする名前をloginやlogoutにするこの場合なくてもいい
post 'logout' => 'user_sessions#destroy', :as => :logout

end
