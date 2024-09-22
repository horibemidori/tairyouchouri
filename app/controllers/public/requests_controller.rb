class Public::RequestsController < ApplicationController
  before_action :authenticate_user!
  def create
    @group = Group.find(params[:group_id])
    request = current_user.requests.new(group_id: params[:group_id])
    request.save
    redirect_to group_path(@group), notice: "グループへ参加申請をしました"
  end

  def destroy
    @group = Group.find(params[:group_id])
    request = Request.find_by(group_id: params[:group_id])
    request.destroy
    redirect_to group_path(@group), alert: "グループへの参加申請を取消しました"
  end
end
