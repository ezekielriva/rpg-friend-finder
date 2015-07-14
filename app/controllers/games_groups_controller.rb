class GamesGroupsController < DashboardController
  add_breadcrumb "Groups", :groups_path
  before_filter :set_group
  before_filter :set_broadcrumb

  def new
    @title    = "Games"
    @subtitle = "add"
    @collection = Game.not_in_group(@group)
                      .decorate
  end

  def create
    @title    = "Games"
    @subtitle = "add"
    game_ids = params[:group][:games].compact
    @games  = Game.where(id: game_ids)
    @group.games << @games

    redirect_to @group, notice: "#{@games.size} games have been invited."
  end

  def destroy
    game = @group.games.find(params[:id])

    if @group.games.destroy(game)
      redirect_to :back, notice: "#{game.decorate} has been removed from #{@group.decorate}"
    else
      redirect_to :back, alert: "#{game.decorate} doesn't belongs to this group"
    end
  end

  private

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end

  def set_broadcrumb
    add_breadcrumb @group.decorate, group_path(@group)
  end

end
