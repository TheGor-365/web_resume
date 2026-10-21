module PortfolioHelper
  # Only published, personally attributable public repositories.
  # "demo" URLs are intentionally omitted until they have been verified.
  PROJECTS = [
    { key: :web_resume, name: "Web Resume", repo: "https://github.com/TheGor-365/web_resume", stack: "Ruby on Rails · Turbo · PostgreSQL" },
    { key: :github_quality, name: "GitHub Quality", repo: "https://github.com/TheGor-365/rails-project-66", stack: "Rails · GitHub OAuth · RuboCop · CI" },
    { key: :classifieds, name: "Classifieds", repo: "https://github.com/TheGor-365/rails-project-65", stack: "Rails · PostgreSQL · AASM · Pundit" },
    { key: :property_finder, name: "Property Finder", repo: "https://github.com/TheGor-365/property_finder", stack: "Rails · PostgreSQL · Devise" },
    { key: :ai_runner, name: "AI Course Actions Runner", repo: "https://github.com/TheGor-365/ai-course-actions-runner", stack: "GitHub Actions · Automation" }
  ].freeze

  def portfolio_projects
    PROJECTS
  end

  def public_contact_email
    ENV["PUBLIC_CONTACT_EMAIL"].presence
  end
end
