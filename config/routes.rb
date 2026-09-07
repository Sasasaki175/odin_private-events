Rails.application.routes.draw do
  get "users/show"
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root "events#index"
  
  resources :events, only: [:index, :create, :new, :show]
end
