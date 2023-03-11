class PagesController < ApplicationController
  def home
  end

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
end
