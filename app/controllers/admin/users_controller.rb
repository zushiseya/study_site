class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
  
  def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = "ユーザー削除に成功しました"
      redirect_to admin_posts_path
  end
end
