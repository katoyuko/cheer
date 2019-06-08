Rails.application.routes.draw do


  root "posts#top"
  get "/about" => "posts#about"

  get 'post_categories/show'

  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :posts
  resources :post_categories, only: [:create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
