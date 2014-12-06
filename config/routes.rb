Rails.application.routes.draw do
  root 'missed_connection#index'
  devise_for :users

  resources :missed_connections do
    resources :messages
  end
  resources :missed_connection_verifications
end
