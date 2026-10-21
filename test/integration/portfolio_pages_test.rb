require "test_helper"

class PortfolioPagesTest < ActionDispatch::IntegrationTest
  test "root renders in Russian by default" do
    get root_path
    assert_response :success
    assert_select "html[lang='ru']"
    assert_select "h1", text: /Ruby on Rails/
  end

  test "root renders in English when requested" do
    get root_path(locale: :en)
    assert_response :success
    assert_select "html[lang='en']"
    assert_select "h1", text: /Building and improving/
  end

  test "portfolio renders verified repository links" do
    get projects_path(locale: :en)
    assert_response :success
    assert_includes response.body, "TheGor-365/rails-project-66"
  end

  test "experience mutation is not routable" do
    assert_raises(ActionController::RoutingError) do
      Rails.application.routes.recognize_path("/experiences", method: :post)
    end
  end
end
