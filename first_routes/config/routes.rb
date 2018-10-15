Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users ,only: [:index,:show,:create,:update,:destroy]
  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # post '/users', to: 'users#create'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
  # get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  # get '/users/new', to: 'users#new', as: 'new_user'
  #
  #
  #
  get '/users/:user_id/comments', to: 'comments#index'
  get '/artworks/:artwork_id/comments', to: 'comments#index'
  get '/users/:user_id/artworks', to: 'artworks#index'
  resources :artworks ,only: [:show,:create,:update,:destroy]
  resources :artwork_shares, only: [:create,:destroy]
  resources :comments, only: [:create,:destroy]
end
