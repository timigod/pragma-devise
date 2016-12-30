# frozen_string_literal: true
module Pragma
  module Devise
    module Recovery
      module Contract
        class Complete < Pragma::Contract::Base
          property :password

          validation do
            required(:password).filled
          end
        end
      end
    end
  end
end
