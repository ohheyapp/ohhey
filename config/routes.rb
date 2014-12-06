Rails.application.routes.draw do
  root 'missed_connections#index'
  devise_for :users
  
  
  resources :messages


  resources :missed_connections do
    resources :messages
  end

  resources :missed_connection_verifications
end
