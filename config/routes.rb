Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root "events#index"

  resources :users, only: [ :index, :show ]
  resources :events
  resources :signups, only: [ :create, :destroy ]
end
