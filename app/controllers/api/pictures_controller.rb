class Api::PicturesController < Api::ApplicationController
  
  def show
    articles = Article.all
    pictures = []
    articles.each do |article|
      pictures.push({ article_id: article.id, picture_num: article.pictures.length})
    end
    render json: { pictures: pictures }.to_json
  end

end