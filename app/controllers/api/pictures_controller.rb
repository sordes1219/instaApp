class Api::PicturesController < Api::ApplicationController
  
  def show
    articles = Article.all
    data = []
    articles.each do |article|
      data.push(article.pictures.length)
    end
    render json: { length: data }.to_json
  end

end