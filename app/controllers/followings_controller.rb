class FollowingsController < ApplicationController

  def show
    user = User.find(params[:user_id])
    @followings = user.followings
  end

end