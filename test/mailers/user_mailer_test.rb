require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  include ActionView::Helpers::TextHelper
  
  test "sends email with article" do
    user = users(:pedro)
    article = articles(:published)

    email = UserMailer.new_article(user, article)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal [user.email], email.to
    assert_equal article.title, email.subject
    assert email.body.include?(simple_format(article.body))
  end
end
