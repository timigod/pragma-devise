# frozen_string_literal: true
module Pragma
  module Devise
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
