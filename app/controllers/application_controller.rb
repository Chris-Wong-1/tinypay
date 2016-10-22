class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # protect CSRF attacks by disabling the Rails authenticity token
  # skip_before_action :verify_authenticity_token

  include ApplicationHelper

  def index
  end

  def reply
    # take the body of the text and set them into an array seperated by spaces or commas
    body = params["Body"].split(' ')
    csbody = params["Body"].split(', ')
    if body[0].downcase == "tiny"
      # help message
      send_tiny_text
      @route = "TINY"
      erb :debug
    elsif body[0].downcase == "setup"
      # if the text has 'setup' in the body, initial setup entry point
      send_setup_text
      @route = "SETUP"
      erb :debug
    elsif body[0].match(/\d{16}/) && body[1].match(/\d{6}/) && body[2].match(/\d{3}/)
      # if the body has a credit card number, first section of setting up account
      #save session[:user] of User.new(card_number: body[0], expiry: body[1], cvv: body[2])
      session[:account] = body
      send_billing_text
      @route = "Credit card entry done.  On to billing."
      erb :debug
    elsif csbody[0].match(/\D+/) && body[-1].match(/\d{5}/)
      # if the body has a name and billing address, second section of account setup
      #billing info.  set session[:address] of User.new(name: csbody[0], address: csbody[1], city: csbody[2], state: csbody[3], zip: csbody[4])
      session[:user] = csbody
      send_setup_password_text
      @route = "Billing complete.  Sent password text"
      erb :debug
    elsif body[0] == body[1]
      # check if passwords match
      #this is to check for password.  if they match, save everything to the DB.
      new_user = User.new(full_name: session[:user][0], address: session[:user][1], city: session[:user][2], state: session[:user][3], zip: session[:user][4], phone: params["From"], account_number: session[:account][0], expiry: session[:account][1], cvv: session[:account][2], password: body[0])
    if new_user.save
      send_confirmation_text
      session[:user] = nil
      session[:account] = nil
      @route = "Confirmed.  Account created."
      erb :debug
    else
      send_error_text
      @route = "Error creating account"
      erb :debug
    end
    elsif body[0] == "send".downcase && body[1].match(/\d+/) && body[-1].match(/\d{10}/)
      # if text has word 'send' to start sending money
      ##  needs database check of phone number
      #start sending money
      send_password_text
      @route = "Start sending money"
      erb :debug
    elsif body[0] == params["From"] && body[1] == User.find_by(phone: params["From"]).password
      # run the mastercard API
      # main
      send_sent_text
      @route = "Money successfully sent"
      erb :debug
    elsif body[0].downcase == "changepassword"
      @route = "changePASSWORD"
      erb :debug
    else
      send_error_text
      session[:user] = nil
      session[:account] = nil
      @route = "Major General ERROR"
      erb :debug
    end
  end

end
