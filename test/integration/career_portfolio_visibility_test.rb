require "test_helper"

class CareerPortfolioVisibilityTest < ActionDispatch::IntegrationTest
  test "public resume panels and charts show technical milestones but not archived jobs" do
    Experience.create!(
      title: "ARCHIVED_EMPLOYMENT_RECORD",
      company: "Archived non-technical employer",
      start_at: Time.utc(2012, 1, 1, 12),
      overview: "Historical employment, retained in the database"
    )
    Experience.create!(
      title: "TECHNICAL_PORTFOLIO_RECORD",
      company: "Личный проект",
      start_at: Time.utc(2026, 1, 1, 12),
      overview: "Public technical milestone",
      note: "Portfolio evidence"
    )

    ["/", "/experience_data", "/timeline"].each do |path|
      get path

      assert_response :success, "Request to #{path} should succeed"
      assert_includes response.body, "TECHNICAL_PORTFOLIO_RECORD"
      refute_includes response.body, "ARCHIVED_EMPLOYMENT_RECORD"
    end
  end
end
