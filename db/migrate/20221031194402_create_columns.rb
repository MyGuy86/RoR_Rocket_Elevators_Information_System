class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.string :batteryid
      t.string :type
      t.string :number_of_floors
      t.string :statues
      t.string :information
      t.string :notes

      t.timestamps
    end
  end
end
