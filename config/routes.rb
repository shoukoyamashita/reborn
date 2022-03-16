Rails.application.routes.draw do
  devise_for :users
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  
  
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  
  resources :users do
    member do
      get :likes
    end
  end
  resources :restaurants do
    resources :comments, only: [:create, :destroy]
  end
  
  resources :mylists, only: [:create, :destroy]
  
end