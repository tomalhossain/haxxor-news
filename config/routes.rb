Rails.application.routes.draw do

  root 'home#index'

  resources :users, only: [:new, :create, :show, :index]
  resources :posts, only: [:new, :create, :show]
  resources :account_activations, only: [:edit]

  get 'signup' => 'users#new'
  get 'users' => 'users#index'

  get 'submit' => 'posts#new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

end

