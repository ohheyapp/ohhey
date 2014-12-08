Rails.application.routes.draw do
  root 'missed_connections#index'
  devise_for :users

  resources :messages
  resources :missed_connections do
    resources :messages
    resources :verifications, controller: :missed_connection_verifications
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :missed_connections, only: [:index, :show]
    end
  end
end
