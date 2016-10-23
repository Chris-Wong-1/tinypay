require 'mastercard_p2p'
require 'faker'

module MastercardSanctionHelper
  include MasterCard::Security::OAuth
  include MasterCard::Core
  include MasterCard::Core::Model
  include MasterCard::API::P2p

  def sanction
    consumerKey = "4FZDE2qryKsPPqA1NwXbbBku3bNHhHZrpZLowyMP6b729703!f435de5c8fe3425aacf9d3b1912611ca0000000000000000"   # You should copy this from "My Keys" on your project page e.g. UTfbhDCSeNYvJpLL5l028sWL9it739PYh6LU5lZja15xcRpY!fd209e6c579dc9d7be52da93d35ae6b6c167c174690b72fa
    keyFile = "/Users/justinwong/Documents/phase-4ever/tinypay/app/helpers/hackathonalias_sandbox.p12" # e.g. /Users/yourname/project/sandbox.p12 | C:\Users\yourname\project\sandbox.p12
    keyAlias = "hackathonalias"   # For production: change this to the key alias you chose when you created your production key
    keyPassword = "hackathon@123"   # For production: change this to the key alias you chose when you created your production key
    auth = OAuth::OAuthAuthentication.new(consumerKey, keyFile, keyAlias, keyPassword)
    Config.setAuthentication(auth)

    Config.setSandbox(true)   # For production: use Config.setSandbox(false)

    mapObj = RequestMap.new # All of this will be pulled from the user's account
    mapObj.set("sanction_screening_input.screening_reference", Faker::Number.number(23))
    mapObj.set("sanction_screening_input.consumer.first_name", "John")
    mapObj.set("sanction_screening_input.consumer.middle_name", "M")
    mapObj.set("sanction_screening_input.consumer.last_name", "Jones")
    mapObj.set("sanction_screening_input.consumer.date_of_birth", "1990-01-01")
    mapObj.set("sanction_screening_input.consumer.address.line1", "Mastercard Blvd")
    mapObj.set("sanction_screening_input.consumer.address.line2", "Suite 240")
    mapObj.set("sanction_screening_input.consumer.address.city", "ofallon")
    mapObj.set("sanction_screening_input.consumer.address.state", "MO")
    mapObj.set("sanction_screening_input.consumer.address.country", "USA")
    mapObj.set("partnerId", "ptnr_2370-10D6-ED32-C98E")

    request = SanctionScreening.new(mapObj)
    response = request.read()
    puts "sanction_screening.id-->#{response.get("sanction_screening.id")}" #sanction_screening.id-->rqst_8A49-4DCB-8965-780B
    puts "sanction_screening.resource_type-->#{response.get("sanction_screening.resource_type")}" #sanction_screening.resource_type-->sanction_screening
    puts "sanction_screening.screening_reference-->#{response.get("sanction_screening.screening_reference")}" #sanction_screening.screening_reference-->ABC_33005507188614978105
    puts "sanction_screening.status-->#{response.get("sanction_screening.status")}" #sanction_screening.status-->SUCCESS
    puts "sanction_screening.score-->#{response.get("sanction_screening.score")}" #sanction_screening.score-->50
  end


end
