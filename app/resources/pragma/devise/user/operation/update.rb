# frozen_string_literal: true
module Pragma
  module Devise
    module User
      module Operation
        class Update < Pragma::Operation::Update
          include Pragma::Devise::Operation::Defaults
          include Pragma::Devise::Operation::Authenticable

          before :authenticate_user
        end
      end
    end
  end
end
