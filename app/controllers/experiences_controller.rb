class ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[ show edit update destroy ]

  def index
    @experiences = Experience.all
    render turbo_stream: turbo_stream.replace("experience", partial: "experiences/graph")
  end

  def timeline
    @experiences = Experience.all
    render turbo_stream: turbo_stream.replace("experience", partial: "experiences/timeline")
  end

  def show; end
  def edit; end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    respond_to do |format|
      if @experience.save
        format.html { redirect_to experience_url(@experience), notice: "Experience was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to experience_url(@experience), notice: "Experience was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url, notice: "Experience was successfully destroyed." }
    end
  end

  private
  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:title, :overview, :cpa, :image)
  end
end
