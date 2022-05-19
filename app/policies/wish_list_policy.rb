# frozen_string_literal: true

class ReelPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record

  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
   return @user && @user.has_any_role?(:admin, :customer)
  end

  def new?
    false
  end

  def update?
  end

  def edit?
    false
  end

  def destroy?
    return @user && @user.has_any_role?(:admin, :customer)
  end

  # def add_to_cart?
  #   return @user && @user.has_any_role?(:admin, :customer)
  # end

  # def remove_from_cart?
  #   add_to_cart?
  # end


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
