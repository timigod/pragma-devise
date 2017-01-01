# frozen_string_literal: true
require 'devise'
require 'knock'

require 'pragma/rails'

require 'pragma/devise/operation/defaults'
require 'pragma/devise/engine'

module Pragma
  module Devise
    mattr_accessor :base_controller, :user_model

    self.base_controller = '::ApplicationController'
    self.user_model = '::User'

    class << self
      def configure
        yield self
      end
    end
  end
end
