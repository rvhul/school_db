require 'rubygems'
require 'twilio-ruby'

class MessengerService
  def initialize

    account_sid = 'AC6ecff972fb895616bac8325b6a86c8da'
    auth_token = '116bb72fd30fdc40402aec7b58077c7a'

    @client = Twilio::REST::Client.new account_sid, auth_token

  end

  def send_sms(from, to, msg)

    @client.messages.create(
      from: from,
      to: to,
      body: msg
    )

  end
end
