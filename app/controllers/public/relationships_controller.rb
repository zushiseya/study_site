class Public::RelationshipsController < ApplicationController
  before_action :set_user, only: [:followings, :followers]
  
  def create
    if params[:user_id].to_i == current_user.id
      flash[:alert] = "自分自身をフォローすることはできません。"
      redirect_to request.referer || user_path(current_user.id) and return
    end
    
    if current_user.follow(params[:user_id])
      flash[:notice] = "フォローしました！"
    else
      flash[:alert] = "フォローできませんでした。"
    end
    redirect_to request.referer || user_path(current_user.id)
  end 
  
  def destroy
    if current_user.unfollow(params[:user_id])
      flash[:notice] = "フォローを解除しました！"
    else
      flash[:alert] = "フォロー解除できませんでした。"
    end
    redirect_to request.referer || user_path(current_user.id)
  end

  def followings
   @users = @user.followings 
  end

  def followers
    @users = @user.followers 
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
end
