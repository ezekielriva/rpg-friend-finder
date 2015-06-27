class UsersController < DashboardController
  def index
    @users = User.all
  end

  def show
  end

  private

  def set_title
    @title = "Freaks"
  end
end
