class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_authentication
  
  private
 
  def configure_authentication
    if admin_controller?
      authenticate_admin!
    else
      authenticate_user! unless action_is_public?
    end
  end
 
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end
 
  def action_is_public?
    if controller_name == 'homes' && action_name == 'about'
      return true
    elsif  controller_name == 'homes' && action_name == 'top' 
      return true
    else
      return false
    end
    
    #controller_name == 'homes' && (action_name == 'about' || action_name == 'top')
  end

  # Deviseで許可するパラメータを設定
  protected

  def configure_permitted_parameters
    # サインアップ時に許可するパラメータ
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント更新時に許可するパラメータ
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
  
  def reset_guest_data
    guest_user = User.find_by(email: User::GUEST_USER_EMAIL)
    guest_user.posts.destroy_all if guest_user.posts.any?
    guest_user.post_comments.destroy_all if guest_user.post_comments.any?
  end
end