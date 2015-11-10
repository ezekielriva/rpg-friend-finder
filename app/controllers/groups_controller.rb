class GroupsController < DashboardController
  before_filter :set_group, only: [:edit, :update, :destroy, :show]
  before_filter :set_games, only: [:index]

  add_breadcrumb I18n.t(".breadcrumbs.groups"), :groups_path

  def index
    filter  = Filter.new(Group, params[:filter])
    @filter = filter.object
    @groups = filter.apply_scopes
  end

  def new
    @group = Group.new
  end

  def create
    if @group = current_user.groups.create(group_params)
      return redirect_to groups_path,
                         notice: I18n.t(".groups.notice.create.success")
    end

    render :new
  end

  def edit
    @title = @group.decorate
  end

  def update
    if @group.update(group_params)
      return redirect_to @group,
                         notice: "#{@group.decorate} has been updated successfully."
    end

    render :edit
  end

  def show
    @title = @group.decorate
    @group = @group.decorate
  end

  def destroy
    @group.destroy
    redirect_to groups_path,
                notice: "#{@group.decorate} has been deleted successfully."
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :encounter_point, :description)
  end

  def set_games
    @games = Game.in_groups.decorate
  end
end
