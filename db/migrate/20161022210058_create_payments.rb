class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :transfer_reference
      t.string :payment_type
      t.string :funding_source0
      t.string :funding_source1
      t.string :amount
      t.string :currency
      t.integer :sender_id
      t.integer :receiver_id
      t.string :payment_origination_country
      t.string :sanction_screening_override
      t.string :statement_descriptor
      t.string :channel
      t.string :text
      t.string :partnerId

      t.timestamps
    end
  end
end
