require "test_helper"

class CareerI18nCertificatesTest < ActionDispatch::IntegrationTest
  test "both alternative languages translate certificate descriptions and modal labels" do
    { en: "My certificates", hy: "Իմ վկայականները" }.each do |locale, heading|
      get "/#{locale}/certificates"
      assert_response :success
      assert_includes response.body, heading
      assert_includes response.body, 'target="toggler"'
      assert_includes response.body, 'data-bs-toggle="modal"'
    end
  end

  test "descriptions for all known course types are complete in RU EN HY" do
    I18n.available_locales.each do |locale|
      %w[hexlet_ru hexlet_en bash bootstrap code_foundation css deploy
         git_github how_to_code javascript_build javascript jquery regexp
         rails_advanced rails ruby sql_advanced sql].each do |key|
        assert I18n.t("site.certificates.descriptions.#{key}", locale: locale, raise: true).present?
      end
    end
  end
end
