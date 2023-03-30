Rails.application.routes.draw do
  resources :reviews, only: [:index, :show, :update, :destroy]
  resources :tenants, only: [:index, :destroy]
  resources :houses


  # create a log in user review

  post 'tenant/review/add', to: "reviews#add_review"


  # additional house routes
  get '/houses/:id/reviews', to: "houses#house_reviews"

  get '/houses/:id/tenants', to: "houses#house_tenant"

  get 'houses/:id/apartment', to: "houses#house_apartment"

  # tenant routes

  # logs in a tenant
  post '/tenants/login', to: "sessions#tenant_login"

  # registers a tenant, adds more detail of the login tenant
  put '/tenants/register', to: "tenants#tenant_register"

  # shows the logged in tenant
  get '/tenant', to: "tenants#tenant"

  # shows the logged in tenants reviews
  get '/tenants/reviews', to: "tenants#tenant_reviews"

  # logs in a tenant
  post '/tenant/login', to: "sessions#tenant_login"

  # signs up a new tenant out a tenant
  post '/tenants/signup', to: "sessions#tenant_signup"

  delete '/tenant/logout', to: "sessions#tenant_logout"
  
  # apartment route
  get '/apartments/:id/houses', to: "apartments#apartment_houses"
  
  resources :landlords, only: [:index, :show, :update, :delete]

  # landlord

  # signs up a new landlord
  post '/landlord/signup', to: "sessions#landlord_signup"

  # logs in a landlord
  post '/landlord/login', to: 'sessions#landlord_login'

  # logs out a landlord
  post 'landlord/logout', to: 'sessions#landlord_logout'

end
