Rails.application.routes.draw do
 

  #user routes
  get  "/signup", to: "users#new"
  get "profile", to: "users#show"
  resources :users, only: [:create]

  #sessions routes
  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"
  resources :sessions, only: [:create]

  #blog routes
  resources :blogs, except: [:index]

  root "blogs#index"

end
