Rails.application.routes.draw do
  root to: "links#index"

  get "login", to: "sessions#new"
end
