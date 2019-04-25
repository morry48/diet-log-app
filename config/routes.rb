Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  root 'logs#index'
  resources :user_wights
  resources :logs do
    collection do
      get 'week_index'
      get 'intro_app'
    end
  end
  resources :weight_logs
end
