class UserMailer < ApplicationMailer
  def new_article(user, article)
    @article = article
    mail(to: user.email, subject: article.title)
  end
end
