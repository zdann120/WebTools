class MessagePolicy < ApplicationPolicy
  def create?
    false
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
