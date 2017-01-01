# frozen_string_literal: true
module Pragma
  module Devise
    module Operation
      # Provides default configuration for Pragma::Devise operations.
      #
      # @author Alessandro Desantis
      module Defaults # :nodoc:
        def self.included(base)
          base.include Pragma::Operation::Defaults
          base.extend ClassMethods
        end

        module ClassMethods # :nodoc:
          # Returns the +user_model+ configuration option.
          #
          # @return [Class]
          def model_klass
            Pragma::Devise.user_model.constantize
          end
        end
      end
    end
  end
end
