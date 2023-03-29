Rails.application.routes.draw do
  resources :houses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/houses/:id/reviews', to: "houses#house_reviews"

end
