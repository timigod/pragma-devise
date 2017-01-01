# frozen_string_literal: true
module Pragma
  module Devise
    module User
      class Decorator < Pragma::Decorator::Base
        property :id
        property :email
      end
    end
  end
end
