class FactElevator < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_contacts do |t|
      t.integer :SerialNumber
      t.date :CreationDate
      t.string :CompanyName
      t.string :Email
      t.string :ProjectName

      t.timestamps
    end
  end
end