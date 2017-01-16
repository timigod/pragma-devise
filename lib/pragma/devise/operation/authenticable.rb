# frozen_string_literal: true
module Pragma
  module Devise
    module Operation
      # Provides authentication hooks for your operations.
      #
      # @author Alessandro Desantis
      module Authenticable
        def self.included(klass)
          klass.include InstanceMethods
        end

        module InstanceMethods # :nodoc:
          # If no current user was passed to the operation, responds with 401 Unauthorized and an
          # error payload and aborts the operation.
          def authenticate_user
            return if current_user

            respond_with!(
              status: :unauthorized,
              resource: {
                error_type: :authentication_required,
                error_message: 'You must be authenticated to access this resource.'
              }
            )
          end
        end
      end
    end
  end
end
