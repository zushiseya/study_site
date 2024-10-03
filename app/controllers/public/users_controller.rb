class Public::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :followings, :followers]
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]

  def index
    @users = User.all
  end

  def show
    @posts = @user.posts
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報が更新されました。"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  def favorited_posts
    @favorited_posts = current_user.favorited_posts
  end
  
  def followings
    @followings = @user.followings
  end 
  
  def followers
    @followers = @user.followers
  end 

private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  def is_matching_login_user
    unless @user.id == current_user.id
      flash[:alert] = "編集機能はユーザー以外利用できません。"
      redirect_to posts_path
    end
  end
  
  def ensure_guest_user
    if @user.guest_user?
      flash[:alert] = "ゲストユーザーはプロフィール編集画面に遷移できません。"
      redirect_to user_path(current_user)
    end 
  end
end
