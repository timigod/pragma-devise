# frozen_string_literal: true
require 'test_helper'

class Pragma::Devise::Test < ActiveSupport::TestCase
  test 'truth' do
    assert_kind_of Module, Pragma::Devise
  end
end
