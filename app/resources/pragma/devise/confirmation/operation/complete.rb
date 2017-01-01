# frozen_string_literal: true
module Pragma
  module Devise
    module Confirmation
      module Operation
        class Complete < Pragma::Operation::Base
          include Pragma::Operation::Defaults

          def call
            user = ::User.confirm_by_token(params[:id])

            respond_with_validation_errors!(user) if user.errors.any?

            head :no_content
          end
        end
      end
    end
  end
end
