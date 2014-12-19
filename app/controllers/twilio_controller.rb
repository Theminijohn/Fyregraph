require 'twilio-ruby'
class TwilioController < ApplicationController

  # Incoming Messages
  def incoming_messages

    # Get mobile number and format it correctly
    number = Phony.normalize(params['From']).to_s.delete(' ')
    mobile = Phony.format(number, format: :+, spaces: '')

    # Find
    sender = Contact.find_by_mobile_phone(mobile)

    # Flags

    # <Response/> is the minimum to indicate a "no response" from Twilio
    render xml: '<Response/>'

  end

end
