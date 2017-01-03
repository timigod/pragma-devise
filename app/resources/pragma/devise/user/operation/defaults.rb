module Pragma
  module Devise
    module User
      module Operation
        module Defaults
          def self.included(klass)
            klass.decorator Pragma::Devise.user_decorator.to_s.constantize
          end
        end
      end
    end
  end
end
