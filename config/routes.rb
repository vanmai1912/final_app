Rails.application.routes.draw do
  root "homes#index"
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  get '/homes/albums', to: 'homes#view_albums', as: :view_albums
  devise_for :users
  resources :albums
  resources :photos
  get '/users/:id/show', to: 'users#show', as: :view_user
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
