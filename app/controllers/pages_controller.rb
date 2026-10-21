class PagesController < ApplicationController
  before_action :set_certificates, only: %i[home certificates]
  before_action :set_experiences, only: %i[home]

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
    redirect_to projects_path, status: :see_other
  end

  def certificates
    render turbo_stream: turbo_stream.replace("toggler", partial: "pages/certificates")
  end

  private

  def set_certificates
    @certificates = Certificate.order(:title)
  end

  def set_experiences
    @experiences = Experience.order(start_at: :desc)
  end
end
