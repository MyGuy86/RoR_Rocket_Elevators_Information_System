class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.string :columnid
      t.string :serial_num
      t.string :model
      t.string :type
      t.string :status
      t.string :dateof_commission
      t.string :dateof_last_inspection
      t.string :certificate_of_inspection
      t.string :information
      t.string :notes

      t.timestamps
    end
  end
end
