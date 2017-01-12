# frozen_string_literal: true
module Pragma
  module Devise
    module User
      module Operation
        class Create < Pragma::Operation::Create
          include Pragma::Devise::Operation::Defaults
          include Pragma::Devise::User::Operation::Defaults

          contract Pragma::Devise.user_contracts[:create].to_s.constantize
        end
      end
    end
  end
end
