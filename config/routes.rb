Rails.application.routes.draw do
  get '/login', to: "auth#login"
  post '/login', to: "auth#verify"
  get '/home', to: "screens#show"
  delete '/cats', to: "cats#destroy", as: 'delete'
  get '/Play', to: "neighborhoods#index"
  # get '/new', to: "users#new", as: '/signup'
  resources :families
  resources :cats
  resources :events
  resources :neighborhoods
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
