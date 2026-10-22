require "test_helper"

class CareerI18nCoverTest < ActionDispatch::IntegrationTest
  test "Russian default cover wording and Turbo replacement remain" do
    get "/letter"
    assert_response :success
    assert_includes response.body, 'target="toggler"'
    assert_includes response.body, "Сопроводительное письмо"
  end

  test "English and Armenian cover are translated" do
    get "/en/letter"
    assert_response :success
    assert_includes response.body, "How do I work?"
    assert_includes response.body, 'target="toggler"'
    get "/hy/letter"
    assert_response :success
    assert_includes response.body, "Ինչպե՞ս եմ կազմակերպում աշխատանքը"
  end

  test "all cover copy keys exist in every language" do
    I18n.available_locales.each do |locale|
      %w[heading greeting intro stack portfolio services_heading services
         process_heading process closing signature].each do |key|
        assert I18n.t("site.cover.#{key}", locale: locale, raise: true).present?
      end
    end
  end
end
