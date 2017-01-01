# frozen_string_literal: true
module Pragma
  module Devise
    class ApplicationController < Pragma::Devise.base_controller.constantize
    end
  end
end
