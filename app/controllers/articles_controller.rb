class ArticlesController < ApplicationController
  
  before_action :authenticate_user!, only: %i[new create]

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to articles_path, notice: 'Posted new pictures.'
    else
      flash.now[:error] = 'Failed to post.'
      render :new
    end
  end

  def index
    @articles = Article.all.order('created_at DESC')
  end

  private

  def article_params
    params.require(:article).permit(:description, pictures: [])
  end
end