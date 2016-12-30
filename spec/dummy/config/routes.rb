# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users
  mount Pragma::Devise::Engine => '/pragma-devise'
end
