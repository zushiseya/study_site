class Public::FavoritesController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
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
    @post = Post.find(params[:post_id])
    @favorite = @post.favorites.find_by(user: current_user)
    
    if @favorite.destroy
      flash[:notice] = "いいねを取り消しました"
      redirect_to post_path(@post.id)
    else
      flash[:alert] = "いいねを取り消せませんでした"
      redirect_to post_path(@post.id)
    end 
  end 
end
