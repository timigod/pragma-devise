# frozen_string_literal: true
module Pragma
  module Devise
    module Confirmation
      module Contract
        class Create < Pragma::Contract::Base
          property :email

          validation do
            required(:email).filled(format?: /\A[^@\s]+@[^@\s]+\z/)
          end
        end
      end
    end
  end
end
