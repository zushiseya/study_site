class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only:[:create, :destroy, :ensure_guest_user]
  before_action :ensure_guest_user, only: [:create, :destroy]

  def create
    @favorite = @post.favorites.new(user: current_user)

    if @favorite.save
      flash[:notice] = "いいねしました"
      redirect_to post_path(@post.id)
    else
      flash[:alert] = "いいねできませんでした"
      redirect_to post_path(@post.id)
    end 
  end 
  
  def destroy
    @favorite = @post.favorites.find_by(user: current_user)
    
    if @favorite&.destroy 
      flash[:notice] = "いいねを取り消しました"
      redirect_to post_path(@post.id)
    else
      flash[:alert] = "いいねを取り消せませんでした"
      redirect_to post_path(@post.id)
    end 
  end 
  
   private

  def set_post
    @post = Post.find(params[:post_id])
  end
  
  def ensure_guest_user
    if current_user.guest_user?
      flash[:alert] = "ゲストユーザーはいいね機能を利用できません。"
      redirect_to post_path(@post.id)
    end
  end
end
