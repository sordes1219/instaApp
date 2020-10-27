class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def index
    following_articles = Article.where(user_id: current_user.followings)
    like_articles = Article.joins(:likes).group(:id).order('count(likes.id) DESC').limit(5)
    @articles = Article.where(id: following_articles.pluck(:id) || like_articles.pluck(:id)).order('created_at DESC')
  end

end