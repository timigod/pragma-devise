# frozen_string_literal: true
require 'knock'
require 'devise'

require 'pragma/rails'

require 'pragma/devise/operation/authenticable'
require 'pragma/devise/operation/defaults'
require 'pragma/devise/engine'
require 'pragma/devise/test/helper'

module Pragma
  # Devise integration for the Pragma architecture.
  #
  # @author Alessandro Desantis
  module Devise
    # @!attribute [rw] base_controller
    #   @return [String] the application's base controller
    mattr_accessor :base_controller

    self.base_controller = '::ApplicationController'

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
