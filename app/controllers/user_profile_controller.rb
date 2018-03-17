class UserProfileController < ApplicationController

  def show
    @user_profile = current_user.user_profile
  end

  def edit
    @user_profile = current_user.user_profile
  end

  def update
    @user_profile = current_user.user_profile
    if @user_profile.update(profile_params)
      flash[:success] = "You have updated your profile"
      redirect_to root_path
    else
      flash[:error] = "Error, updating profile"
      render 'edit'
    end
  end

  private


  def profile_params
    params.require(:user_profile).permit(:first_name, :last_name, :zip_code,
                                         :city, :state, :country, :birthday,
                                         :sex)
  end
end
