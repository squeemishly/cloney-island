class MessageSender
  # def self.send_code(phone, code)
  #   account_sid = Figaro.env.twilio_account_sid
  #   auth_token  = Figaro.env.twilio_auth_token
  #   client = Twilio::REST::Client.new(account_sid, auth_token)
  #
  #   message = client.messages.create(
  #     from:  Figaro.env.twilio_number,
  #     to:    phone,
  #     body:  code
  #   )
  #
  #   message.status == 'queued'
  # end

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
