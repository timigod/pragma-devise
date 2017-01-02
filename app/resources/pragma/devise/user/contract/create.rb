# frozen_string_literal: true
module Pragma
  module Devise
    module User
      module Contract
        class Create < Pragma::Devise::User::Contract::Base
          property :password

          validation do
            required(:password).filled(min_size?: 8)
          end
        end
      end
    end
  end
end
