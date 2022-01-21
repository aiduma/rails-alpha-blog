Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles#, only: [:show, :index] 
  get 'signup', to: 'users#new'
  #post 'users', to: 'users#create'
  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'  
end