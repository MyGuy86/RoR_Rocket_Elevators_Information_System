class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.int :CustomerID
      t.string :AddressOfBuilding
      t.string :FullNameOfBuildingAdmin
      t.string :EmailOfAdminOfBuilding
      t.int :PhoneNumOfBuildingAdmin
      t.string :FullNameOfTechContactForBuilding
      t.string :TechContactEmailForBuildling
      t.int :TechContactPhoneForBuilding

      t.timestamps
    end
  end
end
