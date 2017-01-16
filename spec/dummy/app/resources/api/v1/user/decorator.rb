module API
  module V1
    module User
      class Decorator < Pragma::Devise::User::Decorator
        property :full_name, exec_context: :decorator

        def full_name
          'John Doe'
        end
      end
    end
  end
end
