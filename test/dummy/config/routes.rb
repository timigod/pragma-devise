# frozen_string_literal: true
Rails.application.routes.draw do
  mount Pragma::Devise::Engine => '/pragma-devise'
end
