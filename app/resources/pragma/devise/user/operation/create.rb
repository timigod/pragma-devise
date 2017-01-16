# frozen_string_literal: true
module Pragma
  module Devise
    module User
      module Operation
        class Create < Pragma::Operation::Create
          include Pragma::Devise::Operation::Defaults

          include Pragma::Devise::User::Operation::Defaults

          class << self
            def contract_klass
              super || Pragma::Devise::User::Contract::Create
            end
          end
        end
      end
    end
  end
end
