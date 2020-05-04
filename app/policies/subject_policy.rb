class SubjectPolicy < ApplicationPolicy
  def index?
    user.role.admin? || user.role.role_type == 'viewer'
  end

  def show?
    user.role.admin? || user.role.role_type == 'viewer'
  end

  def create?
    user.role.admin?
  end

  def new?
    create?
  end

  def update?
    user.role.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.role.admin?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end