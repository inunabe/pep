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
  get 'answers/edit/:answered_user_id/:answer_id/:period_id' => 'answers#edit'
  resources :performances
  get 'performances/department/jimu_senmon' => 'performances#jimu_senmon'
  get 'performances/department/kita' => 'performances#kita'
  get 'performances/department/tokyo' => 'performances#tokyo'
  get 'performances/department/honsya' => 'performances#honsya'
  get 'performances/department/shiryo' => 'performances#shiryo'
  get 'performances/department/ishinomaki' => 'performances#ishinomaki'
  get 'performances/department/takasago' => 'performances#takasago'

  get 'login' => 'user_sessions#new', :as => :login
  # ルート名をloginやlogoutにする
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
