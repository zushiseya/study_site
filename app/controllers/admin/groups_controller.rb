class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin
  layout 'admin'
  
  def index
    @groups = Group.all
  end 
  
  def show
    @group = Group.find(params[:id])
  end 
  
  def destroy
    @group = Group.find(params[:id])
    @group.destroy 
      flash[:notice] = "削除に成功しました"
    redirect_to admin_groups_path
  end 
  
  private
  
  def authenticate_admin
    unless admin_signed_in?
      redirect_to new_admin_ssesion_path, alert: "管理者としてログインが必要です。"
    end 
  end 
end
