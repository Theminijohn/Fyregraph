class Message < ActiveRecord::Base

  # Associations
  belongs_to :user
  belongs_to :project
  belongs_to :contact

  # Validations
  validates :body, presence: true
  # validates :user_id, presence: true
  validates :project_id, presence: true
  validates :contact_id, presence: true
  

  # Send to Twilio
  def send_message(body, contact)

    # Set up the Client
    @client = Twilio::REST::Client.new Settings.twilio.account_sid, Settings.twilio.auth_token

    # Send to Twilio
    @client.account.messages.create({
      from: Settings.twilio.from,
      to: contact.mobile_phone,
      body: self.body 
    })

  end

end
