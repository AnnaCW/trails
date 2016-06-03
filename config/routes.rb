Rails.application.routes.draw do
  root to: "trails#index"
  resources :trails
end
