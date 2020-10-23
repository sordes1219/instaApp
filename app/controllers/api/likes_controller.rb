class Api::LikesController < Api::ApplicationController

  before_action :authenticate_user!

  def index
    likes = current_user.likes
    render json: likes
  end

  def show

  end

  def create
    article = Article.find(params[:article_id])
    article.likes.create!(user_id: current_user.id)
    render json: {status: 'ok'}
  end

  def destroy
    article = Article.find(params[:article_id])
    like = article.likes.find_by(user_id: current_user.id)
    like.destroy!
    render json: {status: 'ok'}
  end

end