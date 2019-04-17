Rails.application.routes.draw do
  root 'logs#index'
  resources :logs do
    collection do
      get 'week_index'
    end
  end
end
