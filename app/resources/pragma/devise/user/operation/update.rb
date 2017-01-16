# frozen_string_literal: true
module Pragma
  module Devise
    module User
      module Operation
        class Update < Pragma::Operation::Update
          include Pragma::Devise::Operation::Authenticable
          include Pragma::Devise::Operation::Defaults

          include Pragma::Devise::User::Operation::Defaults

          def self.inherited(klass)
            super
            klass.before :authenticate_user
          end

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
