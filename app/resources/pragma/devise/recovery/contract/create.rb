# frozen_string_literal: true
module Pragma
  module Devise
    module Recovery
      module Contract
        class Create < Pragma::Contract::Base
          property :email

          validation do
            required(:email).filled
          end
        end
      end
    end
  end
end