Rails.application.routes.draw do
  root 'home#index'

  get "/login" => "sessions#new", as: :login
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy", as: :logout

  resources :ports

end
