# frozen_string_literal: true
module Pragma
  module Devise
    module User
      module Operation
        class Destroy < Pragma::Operation::Destroy
          include Pragma::Devise::Operation::Authenticable
          include Pragma::Devise::Operation::Defaults

          def self.inherited(klass)
            super
            klass.before :authenticate_user
          end
        end
      end
    end
  end
end
