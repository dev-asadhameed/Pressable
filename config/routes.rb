Rails.application.routes.draw do
  resource :sessions, only: %i[create destroy]

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, only: :show
    end
  end

  resources :users, only: %i[create show edit update] do
    resources :friendships, only: %i[create destroy]
  end

  get :login, to: 'sessions#new'
  root 'sessions#new'
end
