require "test_helper"

class CareerI18nServicesRightTest < ActionDispatch::IntegrationTest
  test "both locales show translated right-panel service details and links" do
    { en: "Technologies and approach", hy: "Տեխնոլոգիաներ և մոտեցում" }.each do |locale, text|
      get "/#{locale}/services"
      assert_response :success
      assert_includes response.body, text
      assert_includes response.body, "/media/gor/gor-logo-intro.mp4"
      assert_includes response.body, "https://github.com/TheGor-365/web_resume"
    end
  end
end
