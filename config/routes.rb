Rails.application.routes.draw do

  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  root "posts#top"
  get "/about" => "posts#about"

  devise_for :users

  resources :users, only: [:show, :edit, :update, :destroy]
  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
