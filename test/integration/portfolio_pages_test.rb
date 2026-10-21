require "test_helper"

class PortfolioPagesTest < ActionDispatch::IntegrationTest
  test "Russian homepage renders developer portfolio" do
    get root_url(locale: "ru")
    assert_response :success
    assert_select "html[lang=ru]"
    assert_select "h1", /Ruby on Rails/
  end

  test "English homepage uses English labels" do
    get root_url(locale: "en")
    assert_response :success
    assert_select "html[lang=en]"
    assert_select "h1", /Ruby on Rails/
  end

  test "English projects respond to Turbo Stream navigation" do
    get projects_url(locale: "en"), headers: { "Accept" => "text/vnd.turbo-stream.html" }
    assert_response :success
    assert_includes response.body, "GitHub Quality"
  end

  test "legacy public write routes are not exposed" do
    assert_raises(ActionController::RoutingError) do
      Rails.application.routes.recognize_path("/experiences", method: :post)
    end
  end
end
