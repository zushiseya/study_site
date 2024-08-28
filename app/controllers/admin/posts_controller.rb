class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @posts = Post.all
  end 
  
  def show
    @post = Post.find(params[:id])
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice: "投稿が削除されました"
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content)
  end  
  
  def authenticate_admin!
    if current_user.nil?
      redirect_to new_user_session_path, alert: "ログインが必要です。" 
    elsif !current_user.admin?
      redirect_to root_path, alert: "管理者権限が必要です。"
    end
  end
end
