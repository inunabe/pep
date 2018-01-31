Rails.application.routes.draw do
  root  'users#index'

  resources :users do
    member do
      get 'subordinate_index'
    end
  end

  resources :user_sessions
  resources :questions
  get 'login' => 'user_sessions#new', :as => :login
  # ルート名をloginやlogoutにする
  post 'logout' => 'user_sessions#destroy', :as => :logout


end
