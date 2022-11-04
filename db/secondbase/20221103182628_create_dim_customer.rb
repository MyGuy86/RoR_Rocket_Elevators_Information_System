class CreateDimCustomer < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_customers do |t|
      t.date :CreationDate
      t.string :CompanyName
      t.string :FullNameOfCompanyMainContact
      t.string :EmailOfCompanyMainContact
      t.string :NbElevators
      t.string :CustomerCity

      t.timestamps
    end
  end
end
 
