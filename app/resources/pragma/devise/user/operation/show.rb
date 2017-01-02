# frozen_string_literal: true
module Pragma
  module Devise
    module User
      module Operation
        class Show < Pragma::Operation::Show
          include Pragma::Devise::Operation::Defaults
        end
      end
    end
  end
end
