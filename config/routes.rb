Rails.application.routes.draw do
  root 'missed_connections#index'
  devise_for :users

  namespace :messages do
    resources :inbox, :sent, only: [:index]
  end

  resources :missed_connections, only: [:index, :show, :new, :create] do
    resources :messages, only: [:new, :create]
    resources :verifications, controller: :missed_connection_verifications, only: [:new, :create]
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :missed_connections, only: [:index, :show]
    end
  end
end
