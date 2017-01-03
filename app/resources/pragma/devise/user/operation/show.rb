# frozen_string_literal: true
module Pragma
  module Devise
    module User
      module Operation
        class Show < Pragma::Operation::Show
          include Pragma::Devise::Operation::Defaults
          include Pragma::Devise::Operation::Authenticable

          before :authenticate_user
        end
      end
    end
  end
end
