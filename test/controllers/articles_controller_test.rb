require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "get :index is successful" do
    get articles_path
    assert_response :success
  end

  test "get :index shows articles" do
    get articles_path
    assert_select "table"
    assert body.include?(articles(:published).title)
    assert body.include?(articles(:unpublished).title)
  end

  test "get :new is successful" do
    get new_article_path
    assert_response :success
  end

  test "get :new shows the form with fields" do
    get new_article_path
    assert_select "form"
    assert_select "#article_title"
    assert_select "#article_body"
    assert_select "#article_published"
    assert_select "input[type=submit]"
  end

  test "post :create creates a new article" do
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: { title: "A", body: "B", published: false } }
    end
    assert_redirected_to articles_path

    article = Article.last
    assert_equal "A", article.title
    assert_equal "B", article.body
    assert_not article.published
  end

  test "post :create doesn't create an article if title is empty" do
    assert_no_difference 'Article.count' do
      post articles_path, params: { article: { body: "B", published: false } }
    end
    assert_response :success
    assert_select "form"
  end

  test "delete :destroy removes the article" do
    assert_difference 'Article.count', -1 do
      delete article_path(articles(:published))
    end
    assert_redirected_to articles_path
  end
end
