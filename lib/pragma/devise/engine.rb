# frozen_string_literal: true
module Pragma
  module Devise
    class Engine < ::Rails::Engine
      isolate_namespace Pragma::Devise
    end
  end
end
