require 'twilio-ruby'
require 'figaro'

account_sid = Figaro.env.twilio_account_sid
auth_token = Figaro.env.twilio_auth_token

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+19703266269",    # Replace with your phone number
    from: "+19706209392")  # Replace with your Twilio number

puts message.sid
