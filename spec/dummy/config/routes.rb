# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users
  mount Pragma::Devise::Engine => '/pragma-devise'
  resource :protected_resource, path: 'protected-resource', only: %i(show)
end
