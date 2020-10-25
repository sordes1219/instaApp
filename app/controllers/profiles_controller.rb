class ProfilesController < ApplicationController

  before_action :authenticate_user!, only: %i[update]

  def show
    @user = User.find(params[:id])
    @profile = @user.prepare_profile
  end

  def update
    @profile = current_user.prepare_profile
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