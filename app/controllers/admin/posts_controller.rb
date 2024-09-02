class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

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
  
  def authenticate_admin!
    unless admin_signed_in?
      redirect_to new_admin_session_path, alert: "管理者としてログインが必要です。"
    end
  end
end
