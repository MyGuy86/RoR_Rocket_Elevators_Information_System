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

ActiveRecord::Schema.define(version: 2022_10_26_142942) do

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

  create_table "super_heros", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.text "power"
    t.string "city"
    t.bigint "villianID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "villians", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.text "power"
    t.string "city"
    t.bigint "villianID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
