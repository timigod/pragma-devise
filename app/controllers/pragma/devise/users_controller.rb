# frozen_string_literal: true
module Pragma
  module Devise
    class UsersController < ApplicationController
      include Pragma::Rails::ResourceController

      protected

      def pragma_params
        params.tap do |p|
          p[:id] = current_user&.id if p[:id] == 'current'
        end
      end
    end
  end
end
