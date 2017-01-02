module ProtectedResource
  module Operation
    class Show < Pragma::Operation::Base
      include Pragma::Devise::Operation::Authenticable
      before :authenticate_user

      def call
        head :no_content
      end
    end
  end
end
