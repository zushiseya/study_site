class Public::GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to group_path(@group.id)
    else 
      flash.now[:aleat] = "投稿に失敗しました。"
      render :new
    end 
  end 

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "編集に成功しました。"
      redirect_to group_path(@group.id)
    else
      flash.now[:alert] = "編集に失敗しました。"
      render :edit
    end 
  end
  
  def destroy
    group = Group.find(params[:id])
    group.destroy
    flash[:notice] = "削除に成功しました。"
    redirect_to groups_path
  end
  
  private 
  
  def group_params
    params.require(:group).permit(:name, :description)
  end
end
