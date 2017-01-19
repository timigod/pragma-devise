# frozen_string_literal: true
module Pragma
  module Devise
    module Token
      module Operation
        class Create < Pragma::Operation::Base
          include Pragma::Devise::Operation::Defaults

          class << self
            def contract_klass
              super || Pragma::Devise::Token::Contract::Create
            end
          end

          def call
            validate! OpenStruct.new

            context.user = find_user_for_authentication

            unless context.user
              respond_with!(
                status: :unprocessable_entity,
                resource: {
                  error_type: :invalid_credentials,
                  error_message: 'The credentials you have provided are not valid.'
                }
              )
            end

            unless context.user.active_for_authentication?
              respond_with!(
                status: :unauthorized,
                resource: {
                  error_type: context.user.inactive_message,
                  error_message: I18n.t(
                    "devise.failure.#{context.user.inactive_message}",
                    default: 'You cannot authenticate at this moment.'
                  )
                }
              )
            end

            context.token = Knock::AuthToken.new payload: { sub: context.user.id }
            respond_with status: :created, resource: { token: context.token.token }
          end

          protected

          def find_user_for_authentication
            user = self.class.model_klass.find_for_authentication(email: params[:email])
            user if user && user.valid_password?(params[:password])
          end
        end
      end
    end
  end
end
