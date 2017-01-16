module API
  module V1
    class UsersController < ApplicationController
      include Pragma::Rails::ResourceController
    end
  end
end
