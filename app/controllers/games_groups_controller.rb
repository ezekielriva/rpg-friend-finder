class GamesGroupsController < DashboardController
  add_breadcrumb I18n.t(".breadcrumbs.groups"), :groups_path
  before_filter :set_group
  before_filter :set_broadcrumb
  before_filter :set_title_subtitle, only: [:new, :create]

  def new
    @collection = Game.not_in_group(@group)
                      .decorate
  end

  def create
    game_ids = params[:group][:games].compact
    @games  = Game.where(id: game_ids)
    @group.games << @games

    redirect_to @group, notice: t(".success", count: @games.size)
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

  def set_title_subtitle
    @title    = t("title.games")
    @subtitle = t("subtitle.add")
  end

end
