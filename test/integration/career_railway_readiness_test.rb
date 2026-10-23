require "test_helper"

class CareerRailwayReadinessTest < ActionDispatch::IntegrationTest
  test "health endpoint is independent of database records and locale" do
    get "/up"
    assert_response :success
    assert_equal "ok", response.body
  end

  test "legacy unauthenticated experience and message resources are not routed" do
    %w[experiences messages].each do |resource|
      [:get, :post, :patch, :delete].each do |method|
        assert_raises(ActionController::RoutingError) do
          Rails.application.routes.recognize_path("/#{resource}", method: method)
        end
      end
    end
  end

  test "localized portfolio and contact form routes stay available" do
    get "/en"
    assert_response :success

    get "/hy/services"
    assert_response :success
    assert_includes response.body, 'target="toggler"'

    get "/ru/contact_email"
    assert_response :success
    assert_includes response.body, 'target="experience"'
  end
end
