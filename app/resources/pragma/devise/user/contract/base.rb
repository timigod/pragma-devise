# frozen_string_literal: true
module Pragma
  module Devise
    module User
      module Contract
        class Base < Pragma::Contract::Base
          property :id, writable: false
          property :email

          validation do
            required(:email).filled(format?: /\A[^@\s]+@[^@\s]+\z/)
          end
        end
      end
    end
  end
end
