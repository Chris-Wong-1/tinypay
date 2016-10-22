require 'mastercard_p2p'

include MasterCard::Security::OAuth
include MasterCard::Core
include MasterCard::Core::Model
include MasterCard::API::P2p

def main
    consumerKey = "your consumer key"   # You should copy this from "My Keys" on your project page e.g. UTfbhDCSeNYvJpLL5l028sWL9it739PYh6LU5lZja15xcRpY!fd209e6c579dc9d7be52da93d35ae6b6c167c174690b72fa
    keyFile = "path to your .p12 private key file" # e.g. /Users/yourname/project/sandbox.p12 | C:\Users\yourname\project\sandbox.p12
    keyAlias = "keyalias"   # For production: change this to the key alias you chose when you created your production key
    keyPassword = "keystorepassword"   # For production: change this to the key alias you chose when you created your production key
    auth = OAuth::OAuthAuthentication.new(consumerKey, keyFile, keyAlias, keyPassword)
    Config.setAuthentication(auth)

    Config.setSandbox(true)   # For production: use Config.setSandbox(false)

    mapObj = RequestMap.new
    mapObj.set("payment_transfer.transfer_reference", "40023991848254111813006")
    mapObj.set("payment_transfer.payment_type", "P2P")
    mapObj.set("payment_transfer.funding_source[0]", "CREDIT")
    mapObj.set("payment_transfer.funding_source[1]", "DEBIT")
    mapObj.set("payment_transfer.amount", "1800")
    mapObj.set("payment_transfer.currency", "USD")
    mapObj.set("payment_transfer.sender_account_uri", "acct-ref:ref_20160407070850915")
    mapObj.set("payment_transfer.sender.first_name", "John")
    mapObj.set("payment_transfer.sender.middle_name", "Tyler")
    mapObj.set("payment_transfer.sender.last_name", "Jones")
    mapObj.set("payment_transfer.sender.nationality", "USA")
    mapObj.set("payment_transfer.sender.date_of_birth", "1994-05-21")
    mapObj.set("payment_transfer.sender.address.line1", "21 Broadway")
    mapObj.set("payment_transfer.sender.address.line2", "Apartment A-6")
    mapObj.set("payment_transfer.sender.address.city", "OFallon")
    mapObj.set("payment_transfer.sender.address.country_subdivision", "MO")
    mapObj.set("payment_transfer.sender.address.postal_code", "63368")
    mapObj.set("payment_transfer.sender.address.country", "USA")
    mapObj.set("payment_transfer.sender.phone", "11234565555")
    mapObj.set("payment_transfer.sender.email", "John.Jones123@abcmail.com")
    mapObj.set("payment_transfer.recipient_account_uri", "pan:5013040000000018;exp=2017-08;cvc=123")
    mapObj.set("payment_transfer.recipient.first_name", "Jane")
    mapObj.set("payment_transfer.recipient.middle_name", "Tyler")
    mapObj.set("payment_transfer.recipient.last_name", "Smith")
    mapObj.set("payment_transfer.recipient.nationality", "USA")
    mapObj.set("payment_transfer.recipient.date_of_birth", "1999-12-30")
    mapObj.set("payment_transfer.recipient.address.line1", "1 Main St")
    mapObj.set("payment_transfer.recipient.address.line2", "Apartment 9")
    mapObj.set("payment_transfer.recipient.address.city", "OFallon")
    mapObj.set("payment_transfer.recipient.address.country_subdivision", "MO")
    mapObj.set("payment_transfer.recipient.address.postal_code", "63368")
    mapObj.set("payment_transfer.recipient.address.country", "USA")
    mapObj.set("payment_transfer.recipient.phone", "11234567890")
    mapObj.set("payment_transfer.recipient.email", "Jane.Smith123@abcmail.com")
    mapObj.set("payment_transfer.payment_origination_country", "USA")
    mapObj.set("payment_transfer.sanction_screening_override", " false ")
    mapObj.set("payment_transfer.reconciliation_data.custom_field[0].name", "ABC")
    mapObj.set("payment_transfer.reconciliation_data.custom_field[0].value", "123")
    mapObj.set("payment_transfer.reconciliation_data.custom_field[1].name", "DEF")
    mapObj.set("payment_transfer.reconciliation_data.custom_field[1].value", "456")
    mapObj.set("payment_transfer.reconciliation_data.custom_field[2].name", "GHI")
    mapObj.set("payment_transfer.reconciliation_data.custom_field[2].value", "789")
    mapObj.set("payment_transfer.statement_descriptor", "TST*THANKYOU")
    mapObj.set("payment_transfer.channel", "KIOSK")
    mapObj.set("payment_transfer.text", "funding_source")
    mapObj.set("partnerId", "ptnr_BEeCrYJHh2BXTXPy_PEtp-8DBOo")

    response = PaymentTransfer.create(mapObj)
    puts "transfer.id-->#{response.get("transfer.id")}" #transfer.id-->trn_4MMUC7147Vamd1IVt77DV0d-mIZr
    puts "transfer.resource_type-->#{response.get("transfer.resource_type")}" #transfer.resource_type-->transfer
    puts "transfer.transfer_reference-->#{response.get("transfer.transfer_reference")}" #transfer.transfer_reference-->40023991848254111813006
    puts "transfer.payment_type-->#{response.get("transfer.payment_type")}" #transfer.payment_type-->P2P
    puts "transfer.sender_account_uri-->#{response.get("transfer.sender_account_uri")}" #transfer.sender_account_uri-->acct-ref:ref_20160407070850915
    puts "transfer.sender.first_name-->#{response.get("transfer.sender.first_name")}" #transfer.sender.first_name-->John
    puts "transfer.sender.middle_name-->#{response.get("transfer.sender.middle_name")}" #transfer.sender.middle_name-->Tyler
    puts "transfer.sender.last_name-->#{response.get("transfer.sender.last_name")}" #transfer.sender.last_name-->Jones
    puts "transfer.sender.nationality-->#{response.get("transfer.sender.nationality")}" #transfer.sender.nationality-->USA
    puts "transfer.sender.date_of_birth-->#{response.get("transfer.sender.date_of_birth")}" #transfer.sender.date_of_birth-->1994-05-21
    puts "transfer.sender.address.line1-->#{response.get("transfer.sender.address.line1")}" #transfer.sender.address.line1-->21 Broadway
    puts "transfer.sender.address.line2-->#{response.get("transfer.sender.address.line2")}" #transfer.sender.address.line2-->Apartment A-6
    puts "transfer.sender.address.city-->#{response.get("transfer.sender.address.city")}" #transfer.sender.address.city-->OFallon
    puts "transfer.sender.address.country_subdivision-->#{response.get("transfer.sender.address.country_subdivision")}" #transfer.sender.address.country_subdivision-->MO
    puts "transfer.sender.address.postal_code-->#{response.get("transfer.sender.address.postal_code")}" #transfer.sender.address.postal_code-->63368
    puts "transfer.sender.address.country-->#{response.get("transfer.sender.address.country")}" #transfer.sender.address.country-->USA
    puts "transfer.sender.phone-->#{response.get("transfer.sender.phone")}" #transfer.sender.phone-->11234565555
    puts "transfer.sender.email-->#{response.get("transfer.sender.email")}" #transfer.sender.email-->John.Jones123@abcmail.com
    puts "transfer.recipient_account_uri-->#{response.get("transfer.recipient_account_uri")}" #transfer.recipient_account_uri-->pan:************0018
    puts "transfer.recipient.first_name-->#{response.get("transfer.recipient.first_name")}" #transfer.recipient.first_name-->Jane
    puts "transfer.recipient.middle_name-->#{response.get("transfer.recipient.middle_name")}" #transfer.recipient.middle_name-->Tyler
    puts "transfer.recipient.last_name-->#{response.get("transfer.recipient.last_name")}" #transfer.recipient.last_name-->Smith
    puts "transfer.recipient.nationality-->#{response.get("transfer.recipient.nationality")}" #transfer.recipient.nationality-->USA
    puts "transfer.recipient.date_of_birth-->#{response.get("transfer.recipient.date_of_birth")}" #transfer.recipient.date_of_birth-->1999-12-30
    puts "transfer.recipient.address.line1-->#{response.get("transfer.recipient.address.line1")}" #transfer.recipient.address.line1-->1 Main St
    puts "transfer.recipient.address.line2-->#{response.get("transfer.recipient.address.line2")}" #transfer.recipient.address.line2-->Apartment 9
    puts "transfer.recipient.address.city-->#{response.get("transfer.recipient.address.city")}" #transfer.recipient.address.city-->OFallon
    puts "transfer.recipient.address.country_subdivision-->#{response.get("transfer.recipient.address.country_subdivision")}" #transfer.recipient.address.country_subdivision-->MO
    puts "transfer.recipient.address.postal_code-->#{response.get("transfer.recipient.address.postal_code")}" #transfer.recipient.address.postal_code-->63368
    puts "transfer.recipient.address.country-->#{response.get("transfer.recipient.address.country")}" #transfer.recipient.address.country-->USA
    puts "transfer.recipient.phone-->#{response.get("transfer.recipient.phone")}" #transfer.recipient.phone-->11234567890
    puts "transfer.recipient.email-->#{response.get("transfer.recipient.email")}" #transfer.recipient.email-->Jane.Smith123@abcmail.com
    puts "transfer.transfer_amount.value-->#{response.get("transfer.transfer_amount.value")}" #transfer.transfer_amount.value-->1800
    puts "transfer.transfer_amount.currency-->#{response.get("transfer.transfer_amount.currency")}" #transfer.transfer_amount.currency-->USD
    puts "transfer.created-->#{response.get("transfer.created")}" #transfer.created-->2016-08-29T01:11:02-05:00
    puts "transfer.transaction_history.resource_type-->#{response.get("transfer.transaction_history.resource_type")}" #transfer.transaction_history.resource_type-->list
    puts "transfer.transaction_history.item_count-->#{response.get("transfer.transaction_history.item_count")}" #transfer.transaction_history.item_count-->1
    puts "transfer.transaction_history.data.transaction.id-->#{response.get("transfer.transaction_history.data.transaction.id")}" #transfer.transaction_history.data.transaction.id-->txn_S7hjCOKzzkSzeCTS7g-Fdq0_drCD
    puts "transfer.transaction_history.data.transaction.resource_type-->#{response.get("transfer.transaction_history.data.transaction.resource_type")}" #transfer.transaction_history.data.transaction.resource_type-->transaction
    puts "transfer.transaction_history.data.transaction.account_uri-->#{response.get("transfer.transaction_history.data.transaction.account_uri")}" #transfer.transaction_history.data.transaction.account_uri-->pan:************0018
    puts "transfer.transaction_history.data.transaction.transaction_amount.value-->#{response.get("transfer.transaction_history.data.transaction.transaction_amount.value")}" #transfer.transaction_history.data.transaction.transaction_amount.value-->1800
    puts "transfer.transaction_history.data.transaction.transaction_amount.currency-->#{response.get("transfer.transaction_history.data.transaction.transaction_amount.currency")}" #transfer.transaction_history.data.transaction.transaction_amount.currency-->USD
    puts "transfer.transaction_history.data.transaction.network-->#{response.get("transfer.transaction_history.data.transaction.network")}" #transfer.transaction_history.data.transaction.network-->STAR
    puts "transfer.transaction_history.data.transaction.funds_availability-->#{response.get("transfer.transaction_history.data.transaction.funds_availability")}" #transfer.transaction_history.data.transaction.funds_availability-->IMMEDIATE
    puts "transfer.transaction_history.data.transaction.type-->#{response.get("transfer.transaction_history.data.transaction.type")}" #transfer.transaction_history.data.transaction.type-->PAYMENT
    puts "transfer.transaction_history.data.transaction.create_timestamp-->#{response.get("transfer.transaction_history.data.transaction.create_timestamp")}" #transfer.transaction_history.data.transaction.create_timestamp-->2016-08-29T01:11:02-05:00
    puts "transfer.transaction_history.data.transaction.status-->#{response.get("transfer.transaction_history.data.transaction.status")}" #transfer.transaction_history.data.transaction.status-->APPROVED
    puts "transfer.transaction_history.data.transaction.status_reason-->#{response.get("transfer.transaction_history.data.transaction.status_reason")}" #transfer.transaction_history.data.transaction.status_reason-->APPROVED
    puts "transfer.transaction_history.data.transaction.status_timestamp-->#{response.get("transfer.transaction_history.data.transaction.status_timestamp")}" #transfer.transaction_history.data.transaction.status_timestamp-->2016-08-29T01:11:02-05:00
    puts "transfer.transaction_history.data.transaction.retrieval_reference-->#{response.get("transfer.transaction_history.data.transaction.retrieval_reference")}" #transfer.transaction_history.data.transaction.retrieval_reference-->624200192616
    puts "transfer.transaction_history.data.transaction.system_trace_audit_number-->#{response.get("transfer.transaction_history.data.transaction.system_trace_audit_number")}" #transfer.transaction_history.data.transaction.system_trace_audit_number-->926162
    puts "transfer.reconciliation_data.custom_field[0].name-->#{response.get("transfer.reconciliation_data.custom_field[0].name")}" #transfer.reconciliation_data.custom_field[0].name-->ABC
    puts "transfer.reconciliation_data.custom_field[0].value-->#{response.get("transfer.reconciliation_data.custom_field[0].value")}" #transfer.reconciliation_data.custom_field[0].value-->123
    puts "transfer.reconciliation_data.custom_field[1].name-->#{response.get("transfer.reconciliation_data.custom_field[1].name")}" #transfer.reconciliation_data.custom_field[1].name-->DEF
    puts "transfer.reconciliation_data.custom_field[1].value-->#{response.get("transfer.reconciliation_data.custom_field[1].value")}" #transfer.reconciliation_data.custom_field[1].value-->456
    puts "transfer.reconciliation_data.custom_field[2].name-->#{response.get("transfer.reconciliation_data.custom_field[2].name")}" #transfer.reconciliation_data.custom_field[2].name-->GHI
    puts "transfer.reconciliation_data.custom_field[2].value-->#{response.get("transfer.reconciliation_data.custom_field[2].value")}" #transfer.reconciliation_data.custom_field[2].value-->789
    puts "transfer.statement_descriptor-->#{response.get("transfer.statement_descriptor")}" #transfer.statement_descriptor-->TST*THANKYOU
    puts "transfer.channel-->#{response.get("transfer.channel")}" #transfer.channel-->KIOSK
    puts "transfer.status-->#{response.get("transfer.status")}" #transfer.status-->APPROVED
    puts "transfer.status_timestamp-->#{response.get("transfer.status_timestamp")}" #transfer.status_timestamp-->2016-08-29T01:11:02-05:00


    # This sample shows looping through transfer.reconciliation_data.custom_field
    list = response.get("transfer.reconciliation_data.custom_field")
    list.each_with_index do |item, index|
        puts("index: #{index}")
        puts("name: [#{ item["name"] }]")
        puts("value: [#{ item["value"] }]")

    end


end

main
