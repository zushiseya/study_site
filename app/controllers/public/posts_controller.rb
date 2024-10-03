class  Public::PostsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:create, :new, :edit]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿の更新に成功しました"
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :text, :problem, :explanation)
  end

  def is_matching_login_user
    @post = Post.find(params[:id])
    @user = @post.user
    unless @user == current_user
       flash[:alert] = "編集機能は投稿されたユーザー以外利用できません。"
      redirect_to posts_path
    end
  end

  def ensure_guest_user
    if current_user.guest_user?
      flash[:alert] = "ゲストユーザーは投稿関連機能を利用できません。"
      redirect_to posts_path
    end
  end
end
