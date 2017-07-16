module MessageSender
  def self.send_code(phone, code)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token  = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    message = client.messages.create(
      from:  ENV['TWILIO_NUMBER'],
      to:    phone,
      body:  code
    )

    message.status == 'queued'
  end
end
