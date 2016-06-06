Rails.application.routes.draw do
  root to: "links#index", as: :links

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  resources :users, only: [:new]
end
