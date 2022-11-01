class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :userid
      t.string :customers_creation_date
      t.string :company_name
      t.string :company_headquarters_address
      t.string :company_contact
      t.string :contact_phone_number
      t.string :contact_email
      t.string :company_description
      t.string :sta_name
      t.string :ta_phone
      t.string :tm_email

      t.timestamps
    end
  end
end
