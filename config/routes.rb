Rails.application.routes.draw do
  devise_for :users
  root to: "home#show"
  resources :groups
  resources :payments, only: [:update]
end
