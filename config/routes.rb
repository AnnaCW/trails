Rails.application.routes.draw do
  root to: "trails#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :tags
  end

  resources :users do
    resources :trails, only: [:new, :create]
  end

  resources :trails, only: [:index, :show, :edit, :update, :destroy]
end
