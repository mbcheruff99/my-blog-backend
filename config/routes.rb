Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  get "/posts" => "posts#index"
  get "/posts/:id" => "posts#show"
  post "/posts" => "posts#create"
  patch "/posts/:id" => "posts#update"
  delete "/posts/:id" => "posts#destroy"
  
  post "/users" => "users#create"

  post "/sessions" => "sessions#create"
  delete "/sessions" => "sessions#destroy"

  get "/tags" => "tags#index"
  get "/tags/:id" => "tags#show"
  post "/tags" => "tags#create"
  patch "/tags/:id" => "tags#update"
  delete "/tags/:id" => "tags#destroy"


end
