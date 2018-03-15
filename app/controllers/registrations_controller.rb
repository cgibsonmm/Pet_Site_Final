class RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    super
  end

  def sign_up_params
    params.require(:user).permit(:email, :user_name, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :user_name, :password, :password_confirmation, :current_password)
  end

  protected

  def after_sign_up_path_for(resources)
    @user = resources
    edit_user_user_profile_path(@user, @user)
  end
end
