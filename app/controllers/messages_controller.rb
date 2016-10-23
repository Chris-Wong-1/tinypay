class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  #skip_before_filter :authenticate_user!, :only => "reply"
  include MastercardHelper
  include MastercardSanctionHelper

  def reply
    # message_body = params["Body"]
    # from_number = params["From"]
    # boot_twilio
    # sms = @client.messages.create(
    #   from: Rails.application.secrets.twilio_number,
    #   to: from_number,
    #   body: "Hello there, thanks for texting me. Your number is #{from_number}."
    # )

      # take the body of the text and set them into an array seperated by spaces or commas
    body = params["Body"].split(' ')
    csbody = params["Body"].split(', ')
    p body
    if body[0].downcase == "tiny"
      # help message
      send_tiny_text
      @route = "TINY"
      # erb :debug

    # elsif body[0].downcase == "setup"
    #   # if the text has 'setup' in the body, initial setup entry point
    #   send_setup_text
    #   @route = "SETUP"
    #   erb :debug
    # elsif body[0].match(/\d{16}/) && body[1].match(/\d{6}/) && body[2].match(/\d{3}/)
    #   # if the body has a credit card number, first section of setting up account
    #   #save session[:user] of User.new(card_number: body[0], expiry: body[1], cvv: body[2])
    #   session[:account] = body
    #   send_billing_text
    #   @route = "Credit card entry done.  On to billing."
    #   erb :debug
    # elsif body[0] == body[1]
    #   # check if passwords match
    #   #this is to check for password.  if they match, save everything to the DB.
    #   new_user = User.new(full_name: session[:user][0], address: session[:user][1], city: session[:user][2], state: session[:user][3], zip: session[:user][4], phone: params["From"], account_number: session[:account][0], expiry: session[:account][1], cvv: session[:account][2], password: body[0])
    #   if new_user.save
    #     send_confirmation_text
    #     session[:user] = nil
    #     session[:account] = nil
    #     @route = "Confirmed.  Account created."
    #     erb :debug
    #   else
    #     send_error_text
    #     @route = "Error creating account"
    #     erb :debug
    #   end
  elsif body[0].downcase == "send" #&& body[1].match(/\d+/) && body[-1].match(/\d{10}/)
      # if text has word 'send' to start sending money
      ##  needs database check of phone number
      #start sending money
      session[:payment] = body
      sanction
      # if sanction.response.get("sanction_screening.score") <= 20
        send_password_text
      # else
      #   send_error_text
      # end
    #   @route = "Start sending money"
    #   erb :debug
    # elsif csbody[0].match(/\D+/) && body[-1].match(/\d{5}/)
    #   # if the body has a name and billing address, second section of account setup
    #   #billing info.  set session[:address] of User.new(name: csbody[0], address: csbody[1], city: csbody[2], state: csbody[3], zip: csbody[4])
    #   session[:user] = csbody
    #   send_setup_password_text
    #   @route = "Billing complete.  Sent password text"
    #   erb :debug
  elsif body[0].match(/\d+/)
      # params["From"] && body[1] == User.find_by(phone: params["From"]).password
      # run the mastercard API
      sleep(10)
      main
      send_sent_text
      session[:payment] = nil
      @route = "Money successfully sent"
      # erb :debug
    # elsif body[0].downcase == "changepassword"
    #   @route = "changePASSWORD"
    #   erb :debug
    else
      send_error_text
      session[:user] = nil
      session[:account] = nil
      session[:payment] = nil
      @route = "Major General ERROR"
      # erb :debug
    end
  end

  private

  def boot_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @twilio_number = Rails.application.secrets.twilio_number
    @client = Twilio::REST::Client.new account_sid, auth_token
    @body = params["Body"]
    @from_number = params["From"]
  end

  def send_error_text
    boot_twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "Sorry, you mis-typed something. Please check your spelling and start over again."
      )
  end

  def send_tiny_text
    boot_twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "Welcome to TinyPay! To set up account, reply with 'Setup'.  To send money, enter a phone number and dollar amount, as 'Send 20.09 to 4155558551'. To change password code, reply with 'ChangePassword'. Reply 'STOP' to unsubscribe."
      )
  end


  def send_setup_text
    boot_twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "To start using our service we need your credentials.  Reply with your 16 digit credit or debit card, followed by 6 digit expiry, and 3 digit CVV."
    )
  end

  def send_billing_text
    boot_twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "Billing address is next. Reply with 'Name on card, street address, city, state, zip'."
    )
  end

  def send_setup_password_text
    boot_twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "Lastly, set a secret password, with a minimum of 6 digits, repeated twice for confirmation.  Reply such as '123456 123456'."
      )
  end

  def send_confirmation_text
    boot_twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "To send money, reply with the keyword 'Send' and the dollar amount to a 10 digit phone number, like this: Send 20.09 to 4155558551."
      )
  end

  def send_password_text
    boot_twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "To confirm money transfer of #{session[:payment][1].to_s} to #{session[:payment][-1].to_s}, reply with your password."
      )
  end

  def send_sent_text
    boot_twilio
    party = [@from_number, "3238048081"]
    party.each do |x|
      @client.account.messages.create(
      :from => @twilio_number,
      :to => x,
      :body => "Money sent.  $#{session[:payment][1]} has been sent to #{session[:payment][-1]}.  For security purposes, please delete this conversation."
      )
    end
  end

  #     if body.match(/\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/)
end
