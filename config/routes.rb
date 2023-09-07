Rails.application.routes.draw do
  root to: "blogs#index"
  resources :blogs
  resources :categories, except: [:new, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
