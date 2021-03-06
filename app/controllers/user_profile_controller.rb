class UserProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :profile_owner?, except: %i[new create]
  before_action :set_user

  def new
    @user_profile = UserProfile.new
  end

  def create
    @user_profile = current_user.user_profile.build(default_params)
    @user_profile.save(validate: false)
    redirect_to 'edit'
  end

  def show
    @user_profile = current_user.user_profile
  end

  def edit
    @user_profile = current_user.user_profile
  end

  def update
    @user_profile = current_user.user_profile
    if @user_profile.update(profile_params)
      flash[:notice] = 'Profile updated successfully!'
      redirect_to user_animals_path(current_user)
    else
      flash[:error] = 'Error, updating profile!'
      render 'edit'
    end
  end

  private

  def profile_owner?
    @profile = current_user.user_profile
  end

  def set_user
    @user = current_user
  end

  def profile_params
    params.require(:user_profile).permit(
      :first_name,
      :last_name,
      :zip_code,
      :city,
      :state,
      :country,
      :birthday,
      :sex
    )
  end
end
