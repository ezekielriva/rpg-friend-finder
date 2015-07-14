class GroupsUsersController < DashboardController
  add_breadcrumb "Groups", :groups_path
  before_filter :set_group
  before_filter :set_broadcrumb


  def new
    @title    = "User"
    @subtitle = "Invite"
    @collection = User.not_in_group(@group)
                      .not_owner(current_user)
                      .decorate
  end

  def create
    @title    = "User"
    @subtitle = "Invite"
    member_ids = params[:group][:members].compact
    @members  = User.where(id: member_ids)
    @group.members << @members

    redirect_to @group, notice: "#{@members.size} users have been invited."
  end

  def destroy
    member   = User.find(params[:id])
    relation = GroupUser.where(member: member, group: @group).take

    if relation.nil?
      redirect_to :back, alert: "#{member.decorate} doesn't belongs to this group"
    else
      @group.members.destroy(member)
      redirect_to :back, notice: "#{member.decorate} has been removed from #{@group.decorate}"
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
