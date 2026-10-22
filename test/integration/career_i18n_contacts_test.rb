require "test_helper"

class CareerI18nContactsTest < ActionDispatch::IntegrationTest
  test "contacts labels translate and direct messaging URLs remain intact" do
    { en: "Send a message", hy: "Գրել հաղորդագրություն" }.each do |locale, label|
      get "/#{locale}/contacts"
      assert_response :success
      assert_includes response.body, label
      assert_includes response.body, "https://m.me/gor.webdevelopment"
      assert_includes response.body, 'target="toggler"'
      assert_includes response.body, "WhatsApp Business"
    end
  end
end
