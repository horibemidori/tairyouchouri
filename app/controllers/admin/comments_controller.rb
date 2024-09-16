class Admin::CommentsController < ApplicationController
  layout 'admin'
  def index
   @comments = Comment.all
  end


  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_comments_path, notice: 'コメントを削除しました。'
  end
end
