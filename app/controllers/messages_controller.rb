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
    @message = Message.new
  end

  def edit
  end

  def create

    # Identify Associations
    @project = Project.find(params[:project_id])
    @contact = Contact.find(params[:contact_id])

    # Build Message
    @message = current_user.messages.build(message_params)

    # Set Id's
    @message.project_id = @project.id
    @message.contact_id = @contact.id
    
    # Send to Twilio
    @message.send_message(params[:body], @contact)

    if @message.save
      redirect_to :back, notice: 'Your message was send successfully.'
    else
      render :new 
    end
  end

  def update
    @message.update(message_params)
  end

  def destroy
    @message.destroy
  end

  def incoming_message

    binding.pry

    # Get formatted mobile_phone
    number = Phony.normalize(params['From']).to_s.delete(' ')
    mobile = Phony.format(number, format: :+, spaces: '')

    # Find Contact
    @contact = Contact.find_by_mobile(mobile)

    # Build Message
    @message = @contact.messages.build(body: params['Body'])

    # <Reponse/> is the minimum to indicate a "no response" from Twilio
    render xml: "<Response/>"
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:body, :bug, :references, :references, :references)
    end
end
