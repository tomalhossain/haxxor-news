Rails.application.routes.draw do

  root 'home#index'

  resources :users, only: [:new, :create, :show, :index]
  resources :posts, only: [:new, :create, :show]

  get 'signup' => 'users#new'
  get 'users' => 'users#index'

  get 'submit' => 'posts#new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

end

