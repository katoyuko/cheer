Rails.application.routes.draw do

  root "posts#top"
  get "/about" => "posts#about"
  get "/chart" => "posts#chart"

  devise_for :users

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
    root "posts#top"
    get "/about" => "posts#about"
    resources :posts, only: [:index, :show, :destroy]
    resources :users, only: [:index, :show, :destroy]
    resources :post_categories, only: [:index, :show, :create, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
