# frozen_string_literal: true
module Pragma
  module Devise
    module User
      module Operation
        class Update < Pragma::Operation::Update
          include Pragma::Devise::Operation::Defaults
          include Pragma::Devise::Operation::Authenticable
          include Pragma::Devise::User::Operation::Defaults

          before :authenticate_user

          contract Pragma::Devise.user_contracts[:update].to_s.constantize
        end
      end
    end
  end
end
