# frozen_string_literal: true
require 'knock'
require 'devise'

require 'pragma/rails'

require 'pragma/devise/operation/defaults'
require 'pragma/devise/operation/authenticable'
require 'pragma/devise/engine'
require 'pragma/devise/test/helper'

module Pragma
  # Devise integration for the Pragma architecture.
  #
  # @author Alessandro Desantis
  module Devise
    # @!attribute [rw] base_controller
    #   @return [String] the application's base controller
    #
    # @!attribute [rw] user_model
    #   @return [String] the application's user model
    #
    # @!attribute [rw] user_decorator
    #   @return [String] the decorator to use for users
    mattr_accessor :base_controller, :user_model, :user_decorator

    self.base_controller = '::ApplicationController'
    self.user_model = '::User'
    self.user_decorator = '::Pragma::Devise::User::Decorator'

    class << self
      # Yields the module for configuration.
      #
      # @yield [module] the module
      def configure
        yield self
      end
    end
  end
end
