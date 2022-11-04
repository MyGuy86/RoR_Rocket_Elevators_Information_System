class CreateFactQuotes < SecondBase::Migration[5.2]
  def change
    create_table :fact_quotes do |t|
      t.integer :QuoteID
      t.date :CreationDate
      t.string :CompanyName
      t.string :Email
      t.integer :NbElevator

      t.timestamps

    end
  end
end
