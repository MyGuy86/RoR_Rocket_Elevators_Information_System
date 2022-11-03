class CreateQuotesFactTable < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes_fact do |t|
        t.integer :QuoteID
        t.date :Creation
        t.string :CompanyName
        t.string :Email
        t.integer :NbElevator
  
        t.timestamps
    end
  end
end
