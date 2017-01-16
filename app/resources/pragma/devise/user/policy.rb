# frozen_string_literal: true
module Pragma
  module Devise
    module User
      class Policy < Pragma::Policy::Base
        def self.accessible_by(user:, scope:)
          scope.where(id: user.id)
        end

        def show?
          user.id == resource.id
        end

        def create?
          true
        end

        def update?
          user.id == resource.id
        end

        def destroy?
          user.id == resource.id
        end
      end
    end
  end
end
