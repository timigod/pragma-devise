# frozen_string_literal: true
module Pragma
  module Devise
    module User
      module Operation
        class Index < Pragma::Operation::Index
          include Pragma::Devise::Operation::Defaults
          include Pragma::Devise::Operation::Authenticable
          include Pragma::Devise::User::Operation::Defaults

          before :authenticate_user

          protected

          def build_page_url(page)
            Pragma::Devise::Engine.routes.url_helpers.url_for(params.merge(
              page_param => page,
              only_path: true
            ).symbolize_keys)
          end
        end
      end
    end
  end
end
