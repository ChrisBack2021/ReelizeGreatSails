# frozen_string_literal: true

class ReelPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record

  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
   return @user
  end

  def new?
    create?
  end

  def update?
    return @user && @user.has_any_role?(:admin, :customer)
  end

  def edit?
    update?
  end

  def destroy?
    return @user.has_any_role?(:admin, :customer)
  end

  def add_to_wish_list?
    return @user && @user.has_any_role?(:admin, :customer)
  end

  def remove_from_wish_list?
    add_to_wish_list?
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
