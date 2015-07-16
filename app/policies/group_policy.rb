class GroupPolicy < ApplicationPolicy
  def new?
    @user.present?
  end

  def edit?
    @record.owner == @user
  end

  def destroy?
    edit?
  end
end
