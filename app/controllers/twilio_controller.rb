class TwilioController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def incoming_message

    # binding.pry

    # Get formatted mobile_phone
    number = Phony.normalize(params['From']).to_s.delete(' ')
    mobile = Phony.format(number, format: :+, spaces: '')

    # Find Contact
    @contact = Contact.find_by_mobile_phone(mobile)

    # Build Message
    @message = Message.create(
      body: params['Body'],
      contact_id: @contact.id,
      project_id: @contact.project_id
    )

    # <Reponse/> is the minimum to indicate a "no response" from Twilio
    render xml: "<Response/>"
  end


end
