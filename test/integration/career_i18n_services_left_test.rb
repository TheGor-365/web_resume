require "test_helper"

class CareerI18nServicesLeftTest < ActionDispatch::IntegrationTest
  test "services cards translate without hiding media" do
    { en: "Rails bug fixes", hy: "Rails-ի սխալների որոնում և ուղղում" }.each do |locale, label|
      get "/#{locale}/services"
      assert_response :success
      assert_includes response.body, label
      assert_includes response.body, "/media/gor/bugfix-reel.mp4"
      assert_includes response.body, "/media/gor/rails-features.webp"
      assert_includes response.body, 'target="toggler"'
      assert_includes response.body, 'target="experience"'
    end
  end
end
