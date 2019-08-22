Rails.application.routes.draw do
  root "screens#show"
  get '/login', to: "auth#login"
  post '/login', to: "auth#verify"
  get '/home', to: "screens#show"
  delete '/cats', to: "cats#destroy", as: 'delete'
  get '/Play', to: "days#show"
  delete '/login', to: "auth#logout", as: 'logout'
  get '/groom', to: "grooms#show"
  get '/forage', to: "forages#show"
  get '/end_day', to: "days#index"
  get '/new_day', to: "days#show"

  resources :families
  resources :cats
  resources :events
  resources :neighborhoods
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
