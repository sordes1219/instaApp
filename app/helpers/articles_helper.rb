module ArticlesHelper
  def count_likes(article)
    likes = article.likes
    user = likes.first&.user
    count = likes.count
    if count == 1
      "#{user.account} liked this post"
    elsif count > 1
      "#{user.account} and #{count.to_s(:delimited)} other liked this post"
    end
  end
end