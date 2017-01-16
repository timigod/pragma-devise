# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users, only: [:confirmations, :passwords]

  resource :protected_resource, path: 'protected-resource', only: %i(show)

  namespace :api do
    namespace :v1 do
      resources :tokens, only: %i(create)
      resources :users, only: %i(index show create update destroy)
      resources :recoveries, only: %i(create update)
      resources :confirmations, only: %i(create update)
    end
  end
end
