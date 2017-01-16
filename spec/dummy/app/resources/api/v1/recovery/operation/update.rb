module API
  module V1
    module Recovery
      module Operation
        class Update < Pragma::Devise::Recovery::Operation::Update
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
