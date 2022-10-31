class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.int :BuildingID
      t.string :Type
      t.string :Status
      t.int :EmployeeID
      t.date :CommissionDate
      t.date :LastInspectionDate
      t.string :OperationsCert
      t.text :Information
      t.text :Notes

      t.timestamps
    end
  end
end
