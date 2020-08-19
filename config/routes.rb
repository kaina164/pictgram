Rails.application.routes.draw do
  get 'sessions/new'
  root 'pages#index'
  get 'pages/help'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete 'unfavorites', to: 'favorites#destroy'
  get 'comments', to: 'comments#new'
  post 'comments', to: 'comments#create'
  
  resources :users
  resources :topics
end
