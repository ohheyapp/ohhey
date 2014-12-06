Rails.application.routes.draw do
  root 'missed_connections#index'
  devise_for :users

  resources :missed_connections do
    resources :messages
    resources :verifications, controller: :missed_connection_verifications
  end
end
