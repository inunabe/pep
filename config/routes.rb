Rails.application.routes.draw do
  root  'users#index'
  # root  'user_sessions#new'
  resources :users
  resources :user_sessions

  get 'login' => 'user_sessions#new', :as => :login
  # ルート名をloginやlogoutにする
  post 'logout' => 'user_sessions#destroy', :as => :logout

  resources :questions

end
