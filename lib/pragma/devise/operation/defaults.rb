# frozen_string_literal: true
module Pragma
  module Devise
    module Operation
      module Defaults
        def self.included(base)
          base.include Pragma::Operation::Defaults
          base.extend ClassMethods
        end

        module ClassMethods
          def model_klass
            Pragma::Devise.user_model.constantize
          end
        end
      end
    end
  end
end
