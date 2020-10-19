class ProfilesController < ApplicationController

  before_action :authenticate_user!
  
  def show
    @profile = current_user.profile
    @user = current_user
  end

  def update
    @profile = current_user.profile || current_user.profile.build
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'Update your profile.'
    else
      flash.now[:error] = 'failed to update.'
      render :show
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:avatar)
  end

end