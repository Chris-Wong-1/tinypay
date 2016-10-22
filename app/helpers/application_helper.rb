module ApplicationHelper

  def twilio
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    @body = params["Body"]
    @twilio_number = "14152752690"
    @from_number = params["From"]
  end

  def send_error_text
    twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "Sorry, you mis-typed something. Please check your spelling and start over again."
      )
  end

  def send_tiny_text
    twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "Welcome to TinyPay! To set up account, reply with 'Setup'.  To send money, enter a phone number and dollar amount, as 'Send 20.09 to 4155558551'. To change password code, reply with 'ChangePassword'. Reply 'STOP' to unsubscribe."
      )
  end

  def send_setup_text
    twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "To start using our service we need your credentials.  Reply with your 16 digit credit or debit card, followed by 6 digit expiry, and 3 digit CVV."
    )
  end

  def send_billing_text
    twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "Billing address is next. Reply with 'Name on card, street address, city, state, zip'."
    )
  end

  def send_setup_password_text
    twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "Lastly, set a secret password, with a minimum of 6 digits, repeated twice for confirmation.  Reply such as '123456 123456'."
      )
  end

  def send_confirmation_text
    twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "To send money, reply with the keyword 'Send' and the dollar amount to a 10 digit phone number, like this: Send 20.09 to 4155558551."
      )
  end

  def send_password_text
    twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "To confirm money transfer of #{@body[1].to_s} to #{@body[0].to_s}, reply with your phone number and password."
      )
  end

  def send_sent_text
    twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "Money sent.  $#{@body[1]} has been sent to #{@body[0]}.  For security purposes, please delete this conversation."
      )
  end

  # if body.match(/\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/)

end
