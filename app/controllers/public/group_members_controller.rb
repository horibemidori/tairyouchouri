class Public::GroupMembersController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @request = Request.find(params[:request_id])
    @group_user = GroupUser.create(user_id: @request.user_id, group_id: params[:group_id])
    @request.destroy 
    redirect_to request.referer
  end
end
