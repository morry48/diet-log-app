Rails.application.routes.draw do
  devise_for :users
  root 'logs#index'
  resources :logs do
    collection do
      get 'week_index'
      get 'intro_app'
    end
  end
end
