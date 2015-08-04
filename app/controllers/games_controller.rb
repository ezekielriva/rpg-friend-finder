class GamesController < DashboardController
  before_filter :set_game,  only: [:edit, :update, :destroy, :show]

  add_breadcrumb I18n.t(".breadcrumbs.games"), :games_path

  def index
    @games = Game.all
  end

  def new
    flash.now[:notice] = t(".info")
    @game = Game.new
  end

  def edit
    @title = @game.decorate
  end

  def update
    if @game.update(game_params)
      return redirect_to @game,
                         notice: "#{@game.decorate} has been updated successfully"
    end

    render :edit
  end

  def create
    @game = Game.unscoped.new(game_params)
    @game.players << current_user
    if @game.save
      NotificationMailer.admin_email(text: t(".admin.notification", name: @game.name, id: @game.id) )
                        .deliver_now
      return redirect_to games_path,
                         notice: "The game has been created successfully"
    end
    render :new
  end

  def destroy
    @game.destroy
    redirect_to games_path,
                notice: "#{@game.decorate} has been deleted successfully."
  end

  def show
    @game  = @game.decorate
    @title = @game.to_s
  end

  private

  def game_params
    params.require(:game).permit(:name, :wikipedia_link, :webpage)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
