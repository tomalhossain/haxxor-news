Rails.application.routes.draw do

  root 'home#index'
  get 'signup' => 'users#new'
  get 'users' => 'users#index'

  get 'submit' => 'posts#new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :posts, only: [:new, :create, :show]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :comments, only: [:create]
  resources :votes, only: [:create, :destroy]

end