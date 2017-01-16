module API
  module V1
    module Confirmation
      module Operation
        class Update < Pragma::Devise::Confirmation::Operation::Update
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
