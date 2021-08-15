Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  
  
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  resources :users
  resources :restaurants do
    resources :comments, only: [:create, :destroy]
  end
end