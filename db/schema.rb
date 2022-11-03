# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_11_03_142154) do

  create_table "active_admin_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "address_type"
    t.string "status"
    t.string "entity"
    t.string "number_and_street"
    t.string "suite_or_apartment"
    t.string "city"
    t.string "postal_code"
    t.string "country"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "employee_id"
    t.bigint "building_id"
    t.string "Type"
    t.string "Status"
    t.date "CommissionDate"
    t.date "LastInspectionDate"
    t.string "OperationsCert"
    t.text "Information"
    t.text "Notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_batteries_on_building_id"
    t.index ["employee_id"], name: "index_batteries_on_employee_id"
  end

  create_table "building_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "building_id"
    t.string "InformationKey"
    t.string "Value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_building_details_on_building_id"
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "address_id"
    t.string "FullNameOfBuildingAdmin"
    t.string "EmailOfAdminOfBuilding"
    t.integer "PhoneNumOfBuildingAdmin"
    t.string "FullNameOfTechContactForBuilding"
    t.string "TechContactEmailForBuilding"
    t.integer "TechContactPhoneForBuilding"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_buildings_on_address_id"
    t.index ["customer_id"], name: "index_buildings_on_customer_id"
  end

  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "battery_id"
    t.string "Type"
    t.integer "NumOfFloorsServed"
    t.string "Status"
    t.text "Information"
    t.text "Notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battery_id"], name: "index_columns_on_battery_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.string "CustomerCreationDate"
    t.string "date"
    t.string "CompanyName"
    t.string "CompanyHQAdress"
    t.string "FullNameOfCompanyContact"
    t.string "CompanyContactPhone"
    t.string "CompanyContactEMail"
    t.text "CompanyDesc"
    t.string "FullNameServiceTechAuth"
    t.string "TechAuthPhoneService"
    t.string "TechManagerEmailService"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "dim_customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.date "CreationDate"
    t.string "CompanyName"
    t.string "FullNameOfCompanyMainContact"
    t.string "EmailOfCompanyMainContact"
    t.string "NbElevators"
    t.string "CustomerCity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "column_id"
    t.integer "SerialNumber"
    t.string "Model"
    t.string "Type"
    t.string "Status"
    t.date "CommisionDate"
    t.date "LastInspectionDate"
    t.string "InspectionCert"
    t.text "Information"
    t.text "Notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["column_id"], name: "index_elevators_on_column_id"
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "fact_contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "ContactID"
    t.date "CreationDate"
    t.string "CompanyName"
    t.string "Email"
    t.string "ProjectName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fact_elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "SerialNumber"
    t.date "CommisionDate"
    t.integer "BuildingId"
    t.integer "CustomerID"
    t.string "BuildingCity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fact_quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "QuoteID"
    t.date "Creation"
    t.string "CompanyName"
    t.string "Email"
    t.integer "NbElevator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "Full_name_of_the_contact"
    t.string "Bussiness_name"
    t.string "Email"
    t.string "Phone"
    t.string "Project_name"
    t.string "Project_description"
    t.string "Department_incharge"
    t.string "Message"
    t.string "Attached_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "building_type"
    t.string "service_quality"
    t.string "number_of_apartments"
    t.string "number_of_floors"
    t.string "number_of_businesses"
    t.string "number_of_basements"
    t.string "number_of_parking"
    t.string "number_of_cages"
    t.string "number_of_occupants"
    t.string "number_of_hours"
    t.string "number_of_elevators_needed"
    t.string "price_per_unit"
    t.string "elevator_price"
    t.string "installation_fee"
    t.string "final_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "batteries", "buildings"
  add_foreign_key "batteries", "employees"
  add_foreign_key "building_details", "buildings"
  add_foreign_key "buildings", "addresses"
  add_foreign_key "buildings", "customers"
  add_foreign_key "columns", "batteries"
  add_foreign_key "customers", "users"
  add_foreign_key "elevators", "columns"
  add_foreign_key "employees", "users"
end
