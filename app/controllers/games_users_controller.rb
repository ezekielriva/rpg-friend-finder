class GamesUsersController < DashboardController
  add_breadcrumb I18n.t(".breadcrumbs.games"), :games_path
  before_filter :set_user
  before_filter :set_broadcrumb
  before_filter :set_title_subtitle, only: [:new, :create]

  def new
    @collection = Game.not_played(@user)
                      .decorate
  end

  def create
    game_ids = params[:user][:games].compact
    @games  = Game.where(id: game_ids)
    @user.games << @games

    redirect_to @user, notice: t(".success", count: @games.size)
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

  def set_title_subtitle
    @title    = t("title.games")
    @subtitle = t("subtitle.add")
  end
end
