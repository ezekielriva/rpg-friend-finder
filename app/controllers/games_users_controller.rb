class GamesUsersController < DashboardController
  add_breadcrumb "Games", :games_path
  before_filter :set_user
  before_filter :set_broadcrumb

  def new
    @title    = "Games"
    @subtitle = "add"
    @collection = Game.not_played(@user)
                      .decorate
  end

  def create
    @title    = "Games"
    @subtitle = "add"
    game_ids = params[:user][:games].compact
    @games  = Game.where(id: game_ids)
    @user.games << @games

    redirect_to @user, notice: "#{@games.size} games have been added."
  end

  def destroy
    game = @user.games.find(params[:id])

    if @user.games.destroy(game)
      redirect_to :back, notice: "You don't play #{game.decorate} anymore."
    else
      redirect_to :back, alert: "You don't play #{game.decorate}."
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_broadcrumb
    add_breadcrumb @user.decorate, @user
  end
end
