class CreateFactElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_elevators do |t|
      t.int :SerialNumber
      t.date :CommisionDate
      t.int :BuildingId
      t.int :CustomerID
      t.string :BuildingCity

      t.timestamps
    end
  end
end
