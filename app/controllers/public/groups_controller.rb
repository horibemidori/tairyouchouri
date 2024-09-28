class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy, :permits]
  before_action :ensure_guest_user, only: [:index]
  
  def index
    @group = Group.new
    @groups = Group.all
    @group.owner_id = current_user.id
    @user = User.find(current_user.id)
  end
  
  def show
    @group = Group.find(params[:id])
    @group_members = GroupMember.all
  end
  
  def edit
    @group = Group.find(params[:id])
  end 
  
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      flash[:notice] = "グループ作成に成功しました。"
      redirect_to groups_path
    else
      flash.now[:notice] = "グループ作成に失敗しました。"
      render :index
    end
  end
  
  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end
  
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end
  
  def requests
    @group = Group.find(params[:id])
    @requests = @group.requests
  end
  
  private
  def group_params
    params.require(:group).permit(:title, :introduction)
  end
  
  
 
  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to group_path(@group), alert: "グループオーナーのみ編集が可能です"
    end
  end
  
  def ensure_guest_user
    @user = current_user
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはグループを閲覧できません。"
    end
  end  
end
