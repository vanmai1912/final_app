Rails.application.routes.draw do
  root "homes#index"

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }

  devise_for :users
  resources :albums
  resources :photos

  get '/discover/index', to: "homes#discover_index", as: :view_discover_index
  
  get '/homes/albums', to: 'homes#show', as: :view_albums
  get '/discover/albums', to: "homes#discover_show", as: :view_discover_show

  get '/users/:id/show', to: 'users#view_user', as: :view_user
  get '/users/:id/albums', to: 'users#view_user_album', as: :view_user_album
  get '/users/:id/followers', to: 'users#view_user_follower', as: :view_user_follower
  get '/users/:id/followings', to: 'users#view_user_following', as: :view_user_following
  post 'users/follow/:id', to: 'users#user_follow', as: :user_follow
  delete 'users/follow/:id', to: 'users#user_unfollow', as: :user_unfollow
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
