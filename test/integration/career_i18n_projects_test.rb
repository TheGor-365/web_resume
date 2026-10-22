require "test_helper"

class CareerI18nProjectsTest < ActionDispatch::IntegrationTest
  test "all three languages translate project content while keeping repository URLs" do
    { ru: "Проекты", en: "Projects", hy: "Նախագծեր" }.each do |locale, heading|
      get "/#{locale}/projects"
      assert_response :success
      assert_includes response.body, heading
      assert_includes response.body, 'target="toggler"'
      assert_includes response.body, "https://github.com/TheGor-365/rails-project-66"
      assert_includes response.body, "https://github.com/TheGor-365/web_resume"
    end
  end

  test "localized project descriptions are nonempty and all feature lists have three entries" do
    I18n.available_locales.each do |locale|
      %w[quality classifieds blog resume property runner].each do |key|
        assert I18n.t("site.projects.items.#{key}.description", locale: locale, raise: true).present?
        assert_equal 3, I18n.t("site.projects.items.#{key}.features", locale: locale, raise: true).length
      end
    end
  end
end
