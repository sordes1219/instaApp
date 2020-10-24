class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    article = Article.find(params[:article_id])
    @comments = article.comments
  end

  def create

  end

end