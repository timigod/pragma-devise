# frozen_string_literal: true
module Pragma
  module Devise
    module Recovery
      module Operation
        class Update < Pragma::Operation::Base
          include Pragma::Devise::Operation::Defaults

          def call
            user = self.class.model_klass.reset_password_by_token(
              reset_password_token: params[:id],
              password: params[:password],
              password_confirmation: params[:password]
            )

            validate! user
            respond_with_validation_errors!(user) if user.errors.any?

            head :no_content
          end
        end
      end
    end
  end
end
