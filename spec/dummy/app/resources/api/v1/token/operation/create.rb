module API
  module V1
    module Token
      module Operation
        class Create < Pragma::Devise::Token::Operation::Create
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
