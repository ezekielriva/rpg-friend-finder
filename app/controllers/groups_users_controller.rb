class GroupsUsersController < DashboardController
  def destroy
    member   = User.find(params[:id])
    group    = current_user.groups.find(params[:group_id])
    relation = GroupUser.where(member: member, group: group).take

    if relation.nil?
      redirect_to :back, alert: "#{member.decorate} doesn't belongs to this group"
    else
      group.members.destroy(member)
      redirect_to :back, notice: "#{member.decorate} has been removed from #{group.decorate}"
    end
  end
end
