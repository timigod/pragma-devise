# frozen_string_literal: true
module Pragma
  module Devise
    module Token
      module Contract
        class Create < Pragma::Contract::Base
          property :email
          property :password

          validation do
            required(:email).filled(format?: /\A[^@\s]+@[^@\s]+\z/)
            required(:password).filled
          end
        end
      end
    end
  end
end
