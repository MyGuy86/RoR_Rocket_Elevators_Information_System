class RemovingAddress < ActiveRecord::Migration[5.2]
  def change
    remove_column :buildings, :building_address, :string
  end
end
