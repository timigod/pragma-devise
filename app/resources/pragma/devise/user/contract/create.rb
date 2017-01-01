# frozen_string_literal: true
module Pragma
  module Devise
    module User
      module Contract
        class Create < Pragma::Contract::Base
          property :email
          property :password

          validation do
            required(:email).filled(format?: /\A[^@\s]+@[^@\s]+\z/)
            required(:password).filled(min_size?: 8)
          end
        end
      end
    end
  end
end
