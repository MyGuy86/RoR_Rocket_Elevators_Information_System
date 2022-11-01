class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.string :buildingid
      t.string :type
      t.string :status
      t.string :employeeid
      t.string :dateof_commisssion
      t.string :last_inspection_date
      t.string :certificate_of_operations
      t.string :information
      t.string :notes

      t.timestamps
    end
  end
end
