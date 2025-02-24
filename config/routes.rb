Rails.application.routes.draw do
  root "notes#index"

  # User authentication routes
  get "signup", to: "users#new"
  post "users", to: "users#create"

  # Session management routes
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # Notes routes (only accessible after login)
  resources :notes, only: [:index, :new, :create, :edit, :update, :destroy]

  # Move wildcard route to the bottom
  get "*path", to: redirect("/")
end
