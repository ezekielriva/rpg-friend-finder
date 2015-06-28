class GroupsController < DashboardController
  before_filter :set_group, only: [:edit, :update, :destroy, :show]
  before_filter :set_title, only: [:edit, :show]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    if @group = current_user.groups.create(group_params)
      return redirect_to groups_path,
                         notice: "The group has been created successfully."
    end

    render :new
  end

  def edit; end

  def update
    if @group.update(group_params)
      return redirect_to @group,
                         notice: "#{@group.decorate} has been updated successfully."
    end

    render :edit
  end

  def show
    @subtitle = ""
    @group = @group.decorate
  end

  def destroy
    @group.destroy
    redirect_to groups_path,
                notice: "#{@group.decorate} has been deleted successfully."
  end

  private

  def set_group
    @group = current_user.groups.find(params[:id])
  end

  def set_title
    @title = @group.decorate
  end

  def group_params
    params.require(:group).permit(:name, :encounter_point, :description)
  end
end
