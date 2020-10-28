class FollowMailer < ApplicationMailer
  def new_follower(following, follower)
    @following = following
    @follower = follower
    mail to: @following.email, subject: '【お知らせ】フォローされました'
  end
end