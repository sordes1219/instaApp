class Api::RelationshipsController < Api::ApplicationController
  before_action :authenticate_user!

  def create
    current_user.following_relationship.create!(following_id: params[:user_id])
    redirect_to profile_path(params[:user_id]), notice: 'have followed this user.'
  end

  def destroy
    following_relationship = current_user.following_relationship.find_by(following_id: params[:user_id])
    following_relationship.destroy!
    redirect_to profile_path(params[:user_id]), notice: 'have unfollowed this user.'
  end

end