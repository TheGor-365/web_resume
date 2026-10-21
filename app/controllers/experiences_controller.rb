class ExperiencesController < ApplicationController
  before_action :set_experiences, only: %i[index experience_data timeline]

  def experience_data
    render turbo_stream: turbo_stream.replace("experience", partial: "experiences/experience_data")
  end

  def timeline
    render turbo_stream: turbo_stream.replace("experience", partial: "experiences/timeline")
  end

  def index; end

  def show
    @experience = Experience.find(params[:id])
  end

  private

  def set_experiences
    @experiences = Experience.order(start_at: :desc)
  end
end
