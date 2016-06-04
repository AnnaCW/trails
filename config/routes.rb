Rails.application.routes.draw do
  root to: "trails#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :tags
  end

  resources :users do
    resources :trails
  end

  resources :trails, only: [:index, :show]
end
