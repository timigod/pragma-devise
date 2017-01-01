# frozen_string_literal: true
module Pragma
  module Devise
    class Engine < ::Rails::Engine
      isolate_namespace Pragma::Devise

      config.to_prepare do
        Pragma::Devise.base_controller.constantize.include Knock::Authenticable
      end
    end
  end
end
