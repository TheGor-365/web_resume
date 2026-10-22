require "test_helper"

class CareerI18nTimelineTest < ActionDispatch::IntegrationTest
  include PortfolioMilestoneHelper

  test "localized experience and timeline retain original Turbo targets" do
    get "/en/timeline"
    assert_response :success
    assert_includes response.body, "Development milestones by year"
    assert_includes response.body, "Types of technical milestones"
    assert_includes response.body, 'target="experience"'

    get "/hy/experience_data"
    assert_response :success
    assert_includes response.body, "Ծրագրավորման ուղին"
    assert_includes response.body, 'target="experience"'
  end

  test "repository anchored translation is read-only and preserves evidence URL" do
    event = Experience.new(title: "Property Finder", company: "Учебный проект",
      overview: "Старый текст", note: "https://github.com/TheGor-365/property_finder",
      start_at: Time.zone.parse("2020-08-25"))
    I18n.with_locale(:en) do
      assert_equal "Educational project", portfolio_milestone_category(event.company)
      assert_match(/early educational/, portfolio_milestone_text(event, :overview))
      assert_includes portfolio_milestone_note(event), "https://github.com/TheGor-365/property_finder"
    end
    assert_equal "Старый текст", event.overview
  end

  test "unknown event stays untouched" do
    unknown = Experience.new(title: "Unknown", company: "Учебный проект",
      overview: "Original description", note: "Unrecognized proof", start_at: Date.new(2024, 1, 1))
    I18n.with_locale(:hy) do
      assert_equal "Original description", portfolio_milestone_text(unknown, :overview)
      assert_equal "Unrecognized proof", portfolio_milestone_note(unknown)
    end
  end

  test "all chart labels, event keys and headings exist for RU EN HY" do
    I18n.available_locales.each do |locale|
      %w[headings.journey headings.yearly headings.types headings.events
         labels.type labels.date labels.work labels.evidence labels.year labels.repo_source
         categories.educational categories.personal categories.education categories.infrastructure
         notices.journey notices.metrics].each do |key|
        assert I18n.t("site.timeline.#{key}", locale: locale, raise: true).present?
      end
      %w[property_finder web_resume blog classifieds quality hexlet runner].each do |key|
        %w[title overview].each do |attr|
          assert I18n.t("site.timeline.events.#{key}.#{attr}", locale: locale, raise: true).present?
        end
      end
    end
  end
end
