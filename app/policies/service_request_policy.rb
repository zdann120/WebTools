class ServiceRequestPolicy < ApplicationPolicy
  def show?
    (record.user == user) || user.admin?
  end

  def override?
    is_admin?(user)
  end

  def begin?
    is_admin?(user)
  end

  def complete?
    is_admin?(user)
  end

  def cancel?
    is_admin?(user)
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

  private

  def is_admin?(u)
    user.admin?
  end
end
