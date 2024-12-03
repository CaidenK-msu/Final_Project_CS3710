Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  root "events#index"
  
  # User routes
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/profile", to: "users#show"

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"

  resources :events
end