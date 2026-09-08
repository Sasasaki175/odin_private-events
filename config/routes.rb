Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root "events#index"
  
  resources :users, only: [ :show ]
  resources :events, only: [ :index, :create, :new, :show ]
  resources :signups, only: [ :create ]
end
