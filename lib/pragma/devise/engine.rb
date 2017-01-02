# frozen_string_literal: true
module Pragma
  module Devise
    class Engine < ::Rails::Engine # :nodoc:
      isolate_namespace Pragma::Devise

      config.to_prepare do
        Pragma::Devise.base_controller.constantize.tap do |klass|
          klass.include Knock::Authenticable
          klass.class_eval <<~RUBY
            def current_#{Pragma::Devise.user_model.constantize.to_s.underscore}
              begin
                Knock::AuthToken.new(token: token).entity_for(Pragma::Devise.user_model.constantize)
              rescue ActiveRecord::RecordNotFound, JWT::DecodeError
                nil
              end
            end
          RUBY
        end
      end
    end
  end
end
