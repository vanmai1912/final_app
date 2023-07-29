Rails.application.routes.draw do
  root "homes#index"
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }

  devise_for :users
  resources :albums
  resources :photos
  get '/homes/albums', to: 'homes#show', as: :view_albums
  get '/users/:id/show', to: 'users#view_user', as: :view_user
  get '/users/:id/albums', to: 'users#view_user_album', as: :view_user_album
  get '/users/:id/followers', to: 'users#view_user_follower', as: :view_user_follower

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
