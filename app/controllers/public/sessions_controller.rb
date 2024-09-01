# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    posts_path
  end
  
  def after_sign_out_path_for(resource)
    about_path
  end
  
  def destroy
    guest_user = User.find_by(email: User::GUEST_USER_EMAIL)
 
    if guest_user
      guest_user.destroy
    else 
      sign_out
    end 
    redirect_to root_path, notice: "Guest user was successfully destroyed."
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
