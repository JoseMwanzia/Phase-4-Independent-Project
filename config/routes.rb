Rails.application.routes.draw do
  resources :reviews
  resources :tenants, only: [:index, :show, :update, :delete]
  resources :houses
 

  get '/houses/:id/reviews', to: "houses#house_reviews"

  get '/houses/:id/tenants', to: "houses#house_tenant"

  get 'houses/:id/apartment', to: "houses#house_apartment"

  # tenant routes

  post '/tenants/login', to: "tenants#tenant_login"

  post '/tenants/register', to: "tenants#tenants_register"

  get '/tenants/:id/reviews', to: "tenants#tenant_reviews"

  post '/tenant/login', to: "sessions#tenant_login"

  post '/tenants/signup', to: "tenants#tenant_signup"

  delete '/tenant/logout', to: "tenants#tenant_logout"
  
  # apartment route
  get '/apartments/:id/houses', to: "apartments#apartment_houses"
  
  resources :landlords, only: [:index, :show, :update, :delete]

  # landlord

  post '/landlord/login', to: 'sessions#landlord_login'

end
