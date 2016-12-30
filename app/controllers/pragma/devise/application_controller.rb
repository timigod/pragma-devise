# frozen_string_literal: true
module Pragma
  module Devise
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception
    end
  end
end
