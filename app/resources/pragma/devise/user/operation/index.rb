# frozen_string_literal: true
module Pragma
  module Devise
    module User
      module Operation
        class Index < Pragma::Operation::Index
          include Pragma::Devise::Operation::Authenticable
          include Pragma::Devise::Operation::Defaults

          def self.inherited(klass)
            super
            klass.before :authenticate_user
          end

          protected

          def build_page_url(page)
            ::Rails.application.routes.url_helpers.url_for(params.merge(
              page_param => page,
              only_path: true
            ).symbolize_keys)
          end
        end
      end
    end
  end
end
