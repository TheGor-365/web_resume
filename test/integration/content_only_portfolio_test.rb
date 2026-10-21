require "test_helper"

class ContentOnlyPortfolioTest < ActionDispatch::IntegrationTest
  test "original Bootstrap two-panel structure remains" do
    get root_path
    assert_response :success
    assert_select "div.card.lay", count: 2
    assert_select "img.photo[height='100']", count: 1
    assert_select "nav.navbar.navbar-dark", count: 1
  end

  test "source-backed public project links replace stale demo links" do
    get projects_path, headers: { "Accept" => "text/vnd.turbo-stream.html" }
    assert_response :success
    assert_includes response.body, "GitHub Quality"
    assert_includes response.body, "Classifieds"
    assert_includes response.body, "TheGor-365/rails-project-66"
  end

  test "technical milestones scope does not include unrelated older career entries" do
    old_job = Experience.create!(title: "Archived nontechnical job", company: "Archived company", start_at: DateTime.new(2011, 1, 1))
    milestone = Experience.create!(title: "Test technical milestone", company: "Учебный проект", start_at: DateTime.new(2025, 1, 1))
    assert_not_includes Experience.public_technical, old_job
    assert_includes Experience.public_technical, milestone
  end
end
