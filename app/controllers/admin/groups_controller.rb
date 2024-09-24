class Admin::GroupsController < ApplicationController
  layout 'admin'
  def index
    @groups = Group.all
  end
  
  def show
    @group = Group.find(params[:id])
    @group_members = GroupMember.all
  end
  
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to admin_groups_path
  end
end
