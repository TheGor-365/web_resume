class PagesController < ApplicationController
  before_action :set_sertificates

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
    render turbo_stream: turbo_stream.replace("toggler", partial: "pages/exercises")
  end

  def certificates
    render turbo_stream: turbo_stream.replace("toggler", partial: "pages/certificates")
    # render turbo_stream: turbo_stream.replace("cert", partial: "pages/certificates")
  end

  private

  def set_sertificates
    @certificates = Certificate.all
  end
end
