require "test_helper"

class CareerI18nResumeTest < ActionDispatch::IntegrationTest
  test "English home translates resume and preserves source links" do
    get "/en"
    assert_response :success
    assert_includes response.body, "Evidence of skills:"
    assert_select 'a[href="https://github.com/TheGor-365/property_finder"]', count: 1
    assert_select 'a[href="https://github.com/TheGor-365/ai-course-actions-runner"]', count: 1
  end

  test "Armenian and Russian resume Turbo endpoints preserve the frame target" do
    get "/hy/resume"
    assert_response :success
    assert_includes response.body, "Հմտությունների հաստատում"
    assert_includes response.body, 'target="toggler"'

    get "/resume"
    assert_response :success
    assert_includes response.body, "Подтверждение навыков:"
  end

  test "required translated resume sections exist in each locale" do
    I18n.available_locales.each do |locale|
      %w[intro.role intro.location intro.open_source
         profile.heading profile.description profile.evidence
         journey.heading journey.property.title journey.web_resume.title
         journey.blog.title journey.classifieds.title journey.quality.title
         journey.hexlet.description journey.runner.title
         skills.heading skills.primary skills.collaboration].each do |key|
        assert I18n.t("site.resume.#{key}", locale: locale, raise: true).present?
      end
    end
  end
end
