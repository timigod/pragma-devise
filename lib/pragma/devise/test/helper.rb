# frozen_string_literal: true
module Pragma
  module Test
    # Provides RSpec helpers for authenticating in tests.
    #
    # @author Alessandro Desantis
    module Helper
      def self.included(klass)
        klass.extend ClassMethods
      end

      module ClassMethods # :nodoc:
        # Authenticate as the given user by setting the appropriate JWT in the +Authorization+
        # header.
        #
        # @param user [Object] user to authenticate with
        def authenticate_as(user)
          before do
            token = Knock::AuthToken.new(payload: { sub: user.id }).token
            header 'Authorization', "Bearer #{token}"
          end
        end
      end
    end
  end
end
