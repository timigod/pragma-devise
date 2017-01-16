# frozen_string_literal: true
module Pragma
  module Devise
    module User
      module Operation
        class Update < Pragma::Operation::Update
          include Pragma::Devise::Operation::Authenticable
          include Pragma::Devise::Operation::Defaults

          before :authenticate_user

          class << self
            def contract_klass
              super || Pragma::Devise::User::Contract::Update
            end
          end
        end
      end
    end
  end
end
