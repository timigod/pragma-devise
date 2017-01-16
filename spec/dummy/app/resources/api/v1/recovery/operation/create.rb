module API
  module V1
    module Recovery
      module Operation
        class Create < Pragma::Devise::Recovery::Operation::Create
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
