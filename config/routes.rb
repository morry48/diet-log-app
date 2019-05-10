Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  root 'logs#intro_app'
  resources :logs do
    collection do
      get 'week_index'
      get 'intro_app'
    end
  end
  resources :weight_logs
end
