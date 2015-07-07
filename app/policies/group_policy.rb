class GroupPolicy < ApplicationPolicy
  def edit?
    @record.owner == @user
  end

  def destroy?
    edit?
  end
end
