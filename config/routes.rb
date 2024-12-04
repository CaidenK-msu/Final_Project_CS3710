Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  
  # Root route
  root "events#index"  # You can change this to 'dashboard#index' if you want the dashboard as the root
  
  # User routes
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/profile", to: "users#show"
  
  # Session routes (for login/logout)
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # Dashboard route
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'

  # Event routes
  resources :events
end