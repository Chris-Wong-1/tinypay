class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :phone
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :nationality
      t.string :date_of_birth
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :country_subdivision
      t.string :postal_code
      t.string :country
      t.string :email

      t.timestamps
    end
  end
end
