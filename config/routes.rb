Rails.application.routes.draw do
  root  'roots#index'

  resources :users do
    member do
      get 'subordinate_index'
    end
  end
  get 'users/:id/:period_id' => 'users#show'

  resources :user_sessions

  resources :questions do
    resources :question_alternatives, only:[:new,:create,:edit,:update]
  end
  resources :answers, only:[:create,:update]
  get 'answers/new/:user_id/:period_id' => 'answers#new'
  get 'answers/:answered_user_id/select_period' => 'answers#select_period'
  get 'answers/:answered_user_id/switch_period' => 'answers#switch_period'
  get 'answers/edit/:answered_user_id/:answer_id' => 'answers#edit'

  get 'login' => 'user_sessions#new', :as => :login
  # ルート名をloginやlogoutにする
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
