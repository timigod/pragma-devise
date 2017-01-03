# frozen_string_literal: true
module Pragma
  module Devise
    module User
      module Operation
        class Create < Pragma::Operation::Create
          include Pragma::Devise::Operation::Defaults
          include Pragma::Devise::User::Operation::Defaults
        end
      end
    end
  end
end
