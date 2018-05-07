require "application_system_test_case"

class ArticlesFlowsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "visiting the index" do
    sign_in users(:pedro)
    visit articles_path
    assert_selector "table tbody tr", count: 2

    click_on "Nuevo Artículo"
    assert_equal new_article_path, current_path

    fill_in "Title", with: "Nuevo articulo"
    fill_in "Body", with: "El cuerpo del articulo"
    click_on "Create Article"

    assert_equal articles_path, current_path
    assert_selector "table tbody tr", count: 3

    article = articles(:published)
    within "#article-#{article.id}" do
      click_on "Eliminar"
    end
    assert_selector "table tbody tr", count: 2
  end
end
