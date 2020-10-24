class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @article = Article.find(params[:article_id])
    @comments = @article.comments
  end

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save!
    render json: @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end

end