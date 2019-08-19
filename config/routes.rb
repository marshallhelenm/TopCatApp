Rails.application.routes.draw do
  resources :relationships
  resources :families
  resources :cats
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
