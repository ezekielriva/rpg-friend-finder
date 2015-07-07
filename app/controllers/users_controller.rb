class UsersController < DashboardController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def set_title
    @title = "Freaks"
  end
end
