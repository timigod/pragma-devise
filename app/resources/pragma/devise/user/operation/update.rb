# frozen_string_literal: true
module Pragma
  module Devise
    module User
      module Operation
        class Update < Pragma::Operation::Update
          include Pragma::Devise::Operation::Defaults
        end
      end
    end
  end
end
