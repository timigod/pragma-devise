# frozen_string_literal: true
module Pragma
  module Devise
    class UsersController < ApplicationController
      include Pragma::Rails::ResourceController

      protected

      def operation_params
        params.tap do |p|
          p[:id] = operation_user&.id if p[:id] == 'current'
        end
      end
    end
  end
end
