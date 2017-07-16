module ConfirmationSender
  def self.send_confirmation_to(user)
    verification_code = CodeGenerator.generate
    user.update(verification_code: verification_code)
    MessageSender.send_code(user.phone, verification_code)
  end
end

module CodeGenerator
  def self.generate
    rand(100000...999999).to_s
  end
end

module MessageSender
  def self.send_code(phone_number, code)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token  = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    message = client.messages.create(
      from:  ENV['TWILIO_NUMBER'],
      to:    phone_number,
      body:  code
    )

    message.status == 'queued'
  end
end
