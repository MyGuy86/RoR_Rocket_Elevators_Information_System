class FactContact < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_contacts1 do |t|
      t.integer :ContactID
      t.date :CreationDate
      t.string :CompanyName
      t.string :Email
      t.string :ProjectName

      t.timestamps
    end
  end
end
