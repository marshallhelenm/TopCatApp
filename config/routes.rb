Rails.application.routes.draw do
  resources :families
  resources :cats
  resources :events
  resources :neighborhoods
  resources :users
  resources :application
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
