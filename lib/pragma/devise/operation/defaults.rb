# frozen_string_literal: true
module Pragma
  module Devise
    module Operation
      module Defaults
        def self.included(klass)
          klass.include Pragma::Operation::Defaults
          klass.extend ClassMethods
        end

        module ClassMethods # :nodoc:
          def decorator_klass
            super || Pragma::Devise::User::Decorator
          end

          def policy_klass
            super || Pragma::Devise::User::Policy
          end
        end
      end
    end
  end
end
