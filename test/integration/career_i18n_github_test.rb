require "test_helper"

class CareerI18nGithubTest < ActionDispatch::IntegrationTest
  test "all localized GitHub strings exist" do
    I18n.available_locales.each do |locale|
      %w[intro repos followers profile recent missing_description last_push
         no_repos unavailable fallback avatar_alt].each do |key|
        assert I18n.t("site.github.#{key}", locale: locale, raise: true).present?
      end
    end
  end

  test "GitHub preview failures are localized without breaking Turbo" do
    GithubPublicPortfolio.stub :call, nil do
      get "/en/exercises"
      assert_response :success
      assert_includes response.body, "GitHub data is currently unavailable"
      assert_includes response.body, 'target="toggler"'

      get "/hy/exercises"
      assert_response :success
      assert_includes response.body, "Այս պահին GitHub-ից տվյալներ"
    end
  end
end
