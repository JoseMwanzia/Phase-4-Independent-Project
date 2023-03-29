Rails.application.routes.draw do
  resources :houses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/houses/:id/reviews', to: "houses#house_reviews"

  get '/houses/:id/tenants', to: "houses#house_tenant"

  get 'houses/:id/apartment', to: "houses#house_apartment"

end
