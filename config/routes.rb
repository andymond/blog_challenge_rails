Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"
  resources :sessions, only: [:create]
  delete "/sessions", to: "sessions#destroy"
  resources :dashboard, only: [:index]
  resources :posts, only: [:new, :create, :index]
end
