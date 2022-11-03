class CreateFactElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_elevators do |t|
      t.integer :SerialNumber
      t.date :CommisionDate
      t.integer :BuildingId
      t.integer :CustomerID
      t.string :BuildingCity

      t.timestamps
    end
  end
end
