class Api::RelationshipsController < Api::ApplicationController
  before_action :authenticate_user!

  def create
    profile = Profile.find(params[:profile_id])
    current_user.following_relationship.create!(following_id: profile.user_id)
    redirect_to profile_path(profile), notice: 'フォローしました'
  end

  def destroy
    profile = Profile.find(params[:profile_id])
    following_relationship = current_user.following_relationship.find_by(following_id: profile.user_id)
    following_relationship.destroy!
    redirect_to profile_path(profile), notice: 'フォロー解除しました'
  end

end