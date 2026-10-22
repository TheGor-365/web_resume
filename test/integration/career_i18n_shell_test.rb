require "test_helper"

class CareerI18nShellTest < ActionDispatch::IntegrationTest
  test "Russian shell retains both Turbo frames and original navigation groups" do
    get "/"
    assert_response :success
    assert_select 'html[lang="ru"]', count: 1
    assert_select 'h1', text: "Гор Хачатрян"
    assert_select 'turbo-frame#toggler', count: 1
    assert_select 'turbo-frame#experience', count: 1
    assert_select 'span.vr', 3
    assert_select 'a[href="/services"]', text: "Услуги"
    assert_select '#language-menu', text: /RU/
  end

  test "English shell translates menus, heading, footer and keeps locale on Turbo URLs" do
    get "/en"
    assert_response :success
    assert_select 'html[lang="en"]', count: 1
    assert_select 'h1', text: "Gor Khachatryan"
    assert_select 'a[href="/en/projects"]', text: "Projects"
    assert_select 'a[href="/en/services"]', text: "Services"
    assert_select 'a[href="/en/contacts"]', text: "Contact"
    assert_select '#language-menu', text: /EN/
    assert_select 'a[href="/hy"][data-turbo="false"]', text: "Հայերեն"
    assert_select '.site-footer', text: /Educational projects/
    get "/en/services"
    assert_response :success
    assert_includes response.body, 'target="toggler"'
    assert_includes response.body, 'target="experience"'
  end

  test "Armenian shell translates menu and preserves links" do
    get "/hy"
    assert_response :success
    assert_select 'html[lang="hy"]', count: 1
    assert_select 'h1', text: "Գոռ Խաչատրյան"
    assert_select 'a[href="/hy/services"]', text: "Ծառայություններ"
    assert_select 'a[href="/hy/contacts"]', text: "Կապ"
    assert_select '#language-menu', text: /Հայ/
    assert_select 'a[href="/ru"][data-turbo="false"]', text: "Русский"
    assert_select '.site-footer', text: /Ուսումնական նախագծերը/
  end

  test "switching locale does not change subsequent default-language requests" do
    get "/hy"
    get "/"
    assert_response :success
    assert_select 'html[lang="ru"]'
    assert_select 'a[href="/resume"]', text: "Резюме"
  end
end
