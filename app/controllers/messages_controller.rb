class MessagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    if current_user
      @message = Message.new
    else
      @message = current_user.messages.build
    end
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
    @message.save
  end

  def update
    @message.update(message_params)
  end

  def destroy
    @message.destroy
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:body, :bug, :references, :references, :references)
    end
end
