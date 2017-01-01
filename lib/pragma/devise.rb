# frozen_string_literal: true
require 'devise'
require 'knock'

require 'pragma/rails'

require 'pragma/devise/operation/defaults'
require 'pragma/devise/engine'

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
    mattr_accessor :base_controller, :user_model

    self.base_controller = '::ApplicationController'
    self.user_model = '::User'

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
