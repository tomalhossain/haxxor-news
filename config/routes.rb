Rails.application.routes.draw do
  root 'home#index'
  resources :posts, only: [:new, :create, :show] 
  end
