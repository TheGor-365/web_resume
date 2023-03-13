class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  def index
    @messages = Message.all
  end

  def show; end
  def edit; end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to message_url(@message) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to message_url(@message) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url }
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :views)
  end
end
