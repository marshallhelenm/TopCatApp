Rails.application.routes.draw do
  get '/login', to: "auth#login"
  post '/login', to: "auth#verify"
  get '/home', to: "screens#home"
  # get '/new', to: "users#new", as: '/signup'
  resources :families
  resources :cats
  resources :events
  resources :neighborhoods
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
