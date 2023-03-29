Rails.application.routes.draw do
  resources :landlords, only: [:index, :show, :update, :delete]

# landlord

  post '/landlord/login', to: 'sessions#landlord_login'
end
