# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_11_02_211927) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "employee_id", null: false
    t.string "role"
    t.string "task"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_assignments_on_employee_id"
    t.index ["event_id"], name: "index_assignments_on_event_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.string "client_type", null: false
    t.string "phone_number"
    t.string "email"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contract_details", force: :cascade do |t|
    t.bigint "contract_id", null: false
    t.bigint "service_id", null: false
    t.integer "quantity"
    t.decimal "unit_price", precision: 12, scale: 2
    t.decimal "subtotal", precision: 12, scale: 2
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_contract_details_on_contract_id"
    t.index ["service_id"], name: "index_contract_details_on_service_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.string "contract_number"
    t.date "contract_date"
    t.decimal "amount", precision: 12, scale: 2
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_contracts_on_event_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.string "phone_number"
    t.string "email"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.bigint "client_id"
    t.string "name"
    t.string "event_type"
    t.date "start_date"
    t.date "end_date"
    t.string "address"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "description"
    t.decimal "base_amount", precision: 12, scale: 2
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "assignments", "employees"
  add_foreign_key "assignments", "events"
  add_foreign_key "contract_details", "contracts"
  add_foreign_key "contract_details", "services"
  add_foreign_key "contracts", "events"
end
