module API
  module V1
    module Confirmation
      module Operation
        class Create < Pragma::Devise::Confirmation::Operation::Create
          class << self
            def model_klass
              ::User
            end
          end
        end
      end
    end
  end
end
