require "test_helper"

class CareerI18nFoundationTest < ActionDispatch::IntegrationTest
  test "existing Russian URLs and Turbo panels remain" do
    get "/"
    assert_response :success
    get "/services"
    assert_response :success
    assert_includes response.body, 'target="toggler"'
    assert_includes response.body, 'target="experience"'
  end

  test "localized route supports the existing dual-panel Turbo response" do
    get "/en"
    assert_response :success
    get "/hy/services"
    assert_response :success
    assert_includes response.body, 'target="toggler"'
    assert_includes response.body, 'target="experience"'
  end

  test "invalid locale cannot match a localized root path" do
    # In Rails' integration test environment, an unrecognized route raises
    # instead of rendering the production 404 error page.
    assert_raises(ActionController::RoutingError) { get "/xx" }
  end

  test "required shell translations exist in all supported locales" do
    I18n.available_locales.each do |locale|
      %w[navigation.resume navigation.services navigation.language_switcher
         layout.title layout.name layout.disclaimer home.name home.role].each do |key|
        assert I18n.t("site.#{key}", locale: locale, raise: true).present?
      end
    end
  end
end
