class ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[ show edit update destroy ]
  before_action :set_experiences, only: %i[ index experience_data timeline ]

  def experience_data
    render turbo_stream: turbo_stream.replace("experience", partial: "experiences/experience_data")
  end

  def timeline
    render turbo_stream: turbo_stream.replace("experience", partial: "experiences/timeline")
  end

  def index; end
  def show; end
  def edit; end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    respond_to do |format|
      if @experience.save
        format.html { redirect_to experience_url(@experience) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to experience_url(@experience) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url }
    end
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def set_experiences
    @experiences = Experience.all
  end

  def experience_params
    params.require(:experience).permit(
      :title,
      :company,
      :overview,
      :note,
      :cpe, 
      :start_at,
      :end_at,
      :image
    )
  end
end
