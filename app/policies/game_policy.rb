class GamePolicy < ApplicationPolicy
  def new?
    @user.present?
  end
end
