class CreateFactQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_quotes do |t|
      t.int :QuoteID
      t.date :Creation
      t.string :CompanyName
      t.string :Email
      t.int :NbElevator

      t.timestamps
    end
  end
end
