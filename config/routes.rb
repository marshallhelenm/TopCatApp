Rails.application.routes.draw do
  root "screens#show"

#log in routes
  get '/login', to: "auth#login"
  post '/login', to: "auth#verify"
  delete '/login', to: "auth#logout", as: 'logout'

#home screen buttons
  get '/home', to: "screens#show"
  delete '/cats', to: "cats#destroy", as: 'delete'
  get '/high_scores', to: "cats#index"
  get 'cat_stats', to: "cats#show"
  get '/Play', to: "days#show"
  get '/rules', to: "users#index"
  get '/account', to: "users#show"



  get 'exit_neighborhood', to: "screens#index"
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
