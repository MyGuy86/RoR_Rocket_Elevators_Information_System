class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :FullName
      t.string :CompanyName
      t.string :EMail
      t.int :Phone
      t.string :ProjectName
      t.string :ProjectDesc
      t.string :ElevatorAdmin
      t.string :Message
      t.binary :AttachedFile
      t.datetime :ContactRequest

      t.timestamps
    end
  end
end
