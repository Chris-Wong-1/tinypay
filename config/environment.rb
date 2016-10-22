# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

TWILIO_SID = ENV['TWILIO_SID']
TWILIO_TOKEN = ENV['TWILIO_TOKEN']
MC_KEY_PASSWORD = ENV['MC_KEY_PASSWORD']
MC_KEY_ALIAS = ENV['MC_KEY_ALIAS']
MC_KEY = ENV['MC_KEY']
MC_PARTNERID = ENV['MC_PARTNERID']
