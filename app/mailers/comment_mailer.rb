class CommentMailer < ApplicationMailer

  def new_comment(article)
    @article = article
    @user = article.user
    mail to: @user.email, subject: '【お知らせ】コメントが追加されました'
  end
end
