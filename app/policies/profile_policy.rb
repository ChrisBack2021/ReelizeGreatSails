# frozen_string_literal: true

class ProfilePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record

  end

  def index?
    return @user && @user.has_role?(:admin)
  end

  def show?
    return @user && @user.has_any_role?(:admin, :customer)
  end

  def create?
   false
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    true
  end

  def destroy?
    return @user && @user.has_any_role?(:admin, :customer)
  end




  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
