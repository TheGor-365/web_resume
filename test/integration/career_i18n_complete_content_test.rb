require "test_helper"

# Regression coverage for the two secondary languages. Turbo Stream responses
# must contain localized server-rendered content: browser auto-translation is
# never part of the implementation.
class CareerI18nCompleteContentTest < ActionDispatch::IntegrationTest
  LOCALES = %w[en hy].freeze
  STATIC_ENDPOINTS = %w[projects certificates services contacts contact_email].freeze

  test "both alternative languages render static sections without Russian copy" do
    LOCALES.each do |locale|
      STATIC_ENDPOINTS.each do |section|
        get "/#{locale}/#{section}"
        assert_response :success, "#{locale}/#{section}"
        assert_no_match(/[А-Яа-яЁё]/, response.body,
          "Russian text remains in #{locale}/#{section}")
        assert_match(/<turbo-stream\b/, response.body)
      end
    end
  end

  test "GitHub fallback content is localized even when API is unavailable" do
    GithubPublicPortfolio.stub :call, nil do
      LOCALES.each do |locale|
        get "/#{locale}/exercises"
        assert_response :success
        assert_no_match(/[А-Яа-яЁё]/, response.body,
          "Russian text remains in #{locale}/exercises")
      end
    end
  end
end
