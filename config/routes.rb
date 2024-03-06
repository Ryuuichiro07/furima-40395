Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  # No route matches [GET] "/users"のエラーで対処するときに記載

  # Defines the root path route ("/")
  # root "articles#index"
end

