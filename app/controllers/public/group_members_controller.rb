class Public::GroupMembersController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @request = Request.find(params[:request_id])
    @group_member = GroupMember.create(user_id: @request.user_id, group_id: params[:group_id])
    @request.destroy 
    redirect_to requests_path(@group)
  end
  def destroy
    @group = Group.find(params[:group_id])
    group_member = GroupMember.find_by(group_id: params[:group_id])
    group_member.destroy 
    redirect_to group_path(@group)
  end
end
