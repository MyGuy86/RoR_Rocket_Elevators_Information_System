class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.int :BatteryID
      t.string :Type
      t.int :NumOfFloorsServed
      t.string :Status
      t.text :Information
      t.text :Notes

      t.timestamps
    end
  end
end
