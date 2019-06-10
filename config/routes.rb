Rails.application.routes.draw do

  root "posts#top"
  get "/about" => "posts#about"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations"
  }

  devise_for :admins, controllers: {
    sessions: "admins/sessions",
    passwords: "admins/passwords",
    registrations: "admins/registrations"
  }

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :post_categories, only: [:create, :show]
  resources :favorite_categories, only: [:create, :destroy]

  resources :posts do
    resource :post_comments, only: [:create, :destroy]
    resource :post_cheers, only: [:create, :destroy]
  end

  namespace :admins do
    resources :posts, only: [:index, :show, :destroy]
    resources :users, only: [:index, :destroy]
    resources :post_categories, only: [:index, :show, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
