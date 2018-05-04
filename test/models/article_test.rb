require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "article is not created without a title" do
    article = Article.new
    assert_not article.save, "article should not be created without a title"
  end

  test ".word_count returns the correct number of words" do
    article = Article.new(title: "Art 1", body: "Hola Mundo. Esto es una prueba!", published: true)
    assert_equal 6, article.word_count
  end

  test "published scope only returns published articles" do
    articles = Article.published
    assert_equal 1, articles.length

    article = articles(:published)
    assert_equal article.id, articles[0].id
  end
end
