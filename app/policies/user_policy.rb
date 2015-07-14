class UserPolicy < ApplicationPolicy
  def edit?
    @record == @user
  end

  def destroy?
    edit?
  end
end
