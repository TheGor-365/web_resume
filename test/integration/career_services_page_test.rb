require "test_helper"

class CareerServicesPageTest < ActionDispatch::IntegrationTest
  test "services replace both original Turbo panels" do
    get services_path
    assert_response :success
    assert_includes response.body, 'target="toggler"'
    assert_includes response.body, 'target="experience"'
    assert_includes response.body, "Услуги Ruby on Rails"
    assert_includes response.body, "Технологии и подход"
  end

  test "navbar keeps the four expected groups" do
    get root_path
    assert_response :success
    assert_select 'a[href="' + services_path + '"]', text: "Услуги"
    assert_select 'a[href="' + letter_path + '"]', text: "Cover"
    assert_select 'a[href="' + contacts_path + '"]', text: "Контакты"
    assert_select 'span.vr', 3
  end
end
