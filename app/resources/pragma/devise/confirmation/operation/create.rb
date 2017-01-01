# frozen_string_literal: true
module Pragma
  module Devise
    module Confirmation
      module Operation
        class Create < Pragma::Operation::Base
          include Pragma::Devise::Operation::Defaults

          def call
            validate! OpenStruct.new

            self.class.model_klass.send_confirmation_instructions(email: params[:email])

            head :no_content
          end
        end
      end
    end
  end
end
