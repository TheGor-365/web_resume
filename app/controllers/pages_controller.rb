require_relative "../services/github_public_portfolio"
class PagesController < ApplicationController
  before_action :set_sertificates
  before_action :set_experiences

  def home; end

  def letter
    render turbo_stream: turbo_stream.replace("toggler", partial: "pages/letter")
  end

  def projects
    render turbo_stream: turbo_stream.replace("toggler", partial: "pages/projects")
  end

  def resume
    render turbo_stream: turbo_stream.replace("toggler", partial: "pages/resume")
  end

  def exercises
    # Read-only public GitHub data. Errors leave the main portfolio functional.
    @github_preview = GithubPublicPortfolio.call
    render turbo_stream: turbo_stream.replace("toggler", partial: "pages/exercises")
  rescue GithubPublicPortfolio::FetchError => error
    Rails.logger.warn("Public GitHub preview unavailable: #{error.message}")
    @github_preview = nil
    render turbo_stream: turbo_stream.replace("toggler", partial: "pages/exercises")
  end

  # CAREER_CONTACT_PAGE_V1: same Turbo replacement mechanic as other tabs.
  # CAREER_SERVICES_V1 — update the same two Turbo frames, no layout changes.
  def services
    render turbo_stream: [
      turbo_stream.replace("toggler", partial: "pages/services"),
      turbo_stream.replace("experience", partial: "pages/services_details")
    ]
  end

  def contacts
    render turbo_stream: turbo_stream.replace("toggler", partial: "pages/contacts")
  end

  def certificates
    render turbo_stream: turbo_stream.replace("toggler", partial: "pages/certificates")
  end

  private

  def set_sertificates
    @certificates = Certificate.all
  end

  def set_experiences
    @experiences = Experience.portfolio_milestones.order(:start_at, :id)
  end
end
