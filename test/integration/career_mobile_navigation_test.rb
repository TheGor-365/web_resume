require "test_helper"

class CareerMobileNavigationTest < ActionDispatch::IntegrationTest
  test "home retains both Turbo frames and adds separate mobile scroll targets" do
    get "/en"
    assert_response :success
    assert_select "#career-primary-panel turbo-frame#toggler"
    assert_select "#career-secondary-panel turbo-frame#experience"
    assert_select ".career-brand-watermark[aria-hidden='true']", count: 1
    assert_select "nav.navbar[data-controller='career-mobile-nav']", count: 1
    assert_select "nav.navbar[data-action*='turbo:before-stream-render@document']", count: 1
    assert_select "nav.navbar a.nav-link[data-action='click->career-mobile-nav#navigate']", count: 9
  end

  test "mobile enhancement retains existing localized Turbo routes" do
    %w[en hy].each do |locale|
      get "/#{locale}/services"
      assert_response :success
      assert_includes response.body, 'target="toggler"'
      assert_includes response.body, 'target="experience"'
    end
  end
  test "mobile locale controls are ordinary links and desktop keeps its dropdown" do
    %w[ru en hy].each do |locale|
      get "/#{locale}"
      assert_response :success
      assert_select "nav #navbarNav .d-lg-none[role='group']", count: 1
      assert_select "nav #navbarNav .d-lg-none a[href='/ru'][data-turbo='false']", count: 1
      assert_select "nav #navbarNav .d-lg-none a[href='/en'][data-turbo='false']", count: 1
      assert_select "nav #navbarNav .d-lg-none a[href='/hy'][data-turbo='false']", count: 1
      assert_select "nav #navbarNav .d-none.d-lg-block button#language-menu", count: 1
    end
  end

end
