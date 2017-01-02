# frozen_string_literal: true
module Pragma
  module Devise
    module User
      module Operation
        class Index < Pragma::Operation::Index
          include Pragma::Devise::Operation::Defaults
        end
      end
    end
  end
end
