Rails.application.routes.draw do
  devise_for :users
  get "/", to: "posts#index"
  resources :users, only: [:show]
  resources :posts, except: [:index]
  resources :likes, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
