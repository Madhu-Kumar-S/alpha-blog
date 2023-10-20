Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "controller#action"
  root "pages#home"
  get 'about', to: 'pages#about'
  
  # to create all the routes for the show article
  # resources :articles

  # to create the route only for the show article
  resources :articles, only: [:show]
end
