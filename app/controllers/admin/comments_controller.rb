class Admin::CommentsController < ApplicationController
before_action :authenticate_admin!
  
  def index
    @comments = Comments.all
  end

def destroy
  @comment = PostComment.find(params[:id])
  @comment.destroy
  redirect_to admin_post_path(@comment.post.id), notice: 'コメントが削除されました'
end
  
   private
   
   def comments_params
     params.require(:comment).permit(:content)
   end 
end 