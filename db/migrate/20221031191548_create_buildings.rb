class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :customerid
      t.string :building_address
      t.string :building_admin
      t.string :admin_email
      t.string :admin_ph_num
      t.string :tc_name
      t.string :tc_email
      t.string :tc_phone

      t.timestamps
    end
  end
end
