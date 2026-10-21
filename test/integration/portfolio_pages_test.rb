require "test_helper"

class PortfolioPagesTest < ActionDispatch::IntegrationTest
  test "Russian homepage restores original two-column cards" do
    get root_url(locale: "ru")
    assert_response :success
    assert_select "html[lang=ru]"
    assert_select "h1", /Хачатрян/
    assert_select ".card.lay", 2
    assert_select "img.photo[height=100]"
  end

  test "English homepage uses English profile content" do
    get root_url(locale: "en")
    assert_response :success
    assert_select "html[lang=en]"
    assert_select "h1", /Gor Khachatryan/
    assert_select ".card.lay", 2
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
