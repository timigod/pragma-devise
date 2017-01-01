# frozen_string_literal: true
module Pragma
  module Devise
    module Recovery
      module Operation
        class Create < Pragma::Operation::Base
          include Pragma::Devise::Operation::Defaults

          def call
            validate! OpenStruct.new

            self.class.model_klass.send_reset_password_instructions(email: params[:email])

            head :no_content
          end
        end
      end
    end
  end
end
