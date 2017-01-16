module Pragma
  module Devise
    module User
      module Operation
        module Defaults
          def self.included(klass)
            klass.include InstanceMethods
          end

          module InstanceMethods
            def params
              super.tap do |p|
                p[:id] = current_user&.id if p[:id] == 'current'
              end
            end
          end
        end
      end
    end
  end
end
