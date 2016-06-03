Rails.application.routes.draw do
  root to: "trails#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    resources :trails
  end

  resources :trails, only: [:index, :show]
end
