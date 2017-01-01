# frozen_string_literal: true
module Pragma
  module Test
    module Helper
      def self.included(klass)
        klass.extend ClassMethods
      end

      module ClassMethods
        def authenticate_as(user)
          before do
            token = Knock::AuthToken.new(payload: { sub: user.id }).token
            header 'Authorization', "Bearer #{token}"
          end
        end
      end
    end
  end
end
