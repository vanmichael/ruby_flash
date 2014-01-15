class MembershipsController < ApplicationController

  def create
    @group = Group.find(params[:group_id])
    @group.users << current_user
    redirect_to @group
  end

  def destroy
    @group = Group.find(params[:group_id])
    @group.memberships.destroy(params[:id])
    redirect_to @group
  end

  private

  def membership_params
    params.require(:membership).permit(:group_id)
  end

end
