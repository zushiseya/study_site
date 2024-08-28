class Admin::CommentsController < ApplicationController
  before_action :authenticate_user!
before_action :authenticate_admin!
  
  def index
    @comments = Comments.all
  end

  def destroy
    @comment = Comments.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path, notice: 'コメントが削除されました'
  end 
  
   private
   
   def comments_params
     params.require(:comment).permit(:content)
   end 
   
  def authenticate_admin!
    redirect_to root_path, alert: "管理者権限が必要です。" unless current_user.admin?
  end
end 