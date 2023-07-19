Rails.application.routes.draw do
  root "photos#index"
  devise_for :users
  resources :albums
  resources :photos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
