# frozen_string_literal: true
module Pragma
  module Devise
    module User
      module Operation
        class Index < Pragma::Operation::Index
          include Pragma::Devise::Operation::Defaults
          include Pragma::Devise::Operation::Authenticable
          include Pragma::Devise::User::Operation::Defaults

          before :authenticate_user
        end
      end
    end
  end
end
