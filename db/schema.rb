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

ActiveRecord::Schema[7.0].define(version: 2024_07_09_184551) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "competences", force: :cascade do |t|
    t.string "description"
    t.string "just_events"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "description"
    t.string "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.date "date_of_birth"
    t.date "admission_date"
    t.date "termination"
    t.integer "role_id", null: false
    t.integer "department_id", null: false
    t.integer "sector_id", null: false
    t.string "address"
    t.string "phone"
    t.string "pension"
    t.integer "nature_id", null: false
    t.integer "situation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["nature_id"], name: "index_employees_on_nature_id"
    t.index ["role_id"], name: "index_employees_on_role_id"
    t.index ["sector_id"], name: "index_employees_on_sector_id"
    t.index ["situation_id"], name: "index_employees_on_situation_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "description"
    t.string "type_event"
    t.string "formula"
    t.boolean "inss"
    t.boolean "irrf"
    t.boolean "rpps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "financials", force: :cascade do |t|
    t.integer "nature_id", null: false
    t.integer "situation_id", null: false
    t.integer "department_id", null: false
    t.integer "sector_id", null: false
    t.integer "employee_id", null: false
    t.integer "role_id", null: false
    t.decimal "value"
    t.integer "competence_id", null: false
    t.date "reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id", null: false
    t.index ["competence_id"], name: "index_financials_on_competence_id"
    t.index ["department_id"], name: "index_financials_on_department_id"
    t.index ["employee_id"], name: "index_financials_on_employee_id"
    t.index ["event_id"], name: "index_financials_on_event_id"
    t.index ["nature_id"], name: "index_financials_on_nature_id"
    t.index ["role_id"], name: "index_financials_on_role_id"
    t.index ["sector_id"], name: "index_financials_on_sector_id"
    t.index ["situation_id"], name: "index_financials_on_situation_id"
  end

  create_table "insses", force: :cascade do |t|
    t.date "star_date"
    t.date "end_date"
    t.decimal "lower_limit"
    t.decimal "upper_limit"
    t.decimal "aliquot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "natures", force: :cascade do |t|
    t.string "description"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.integer "event_id", null: false
    t.decimal "value"
    t.date "start_date"
    t.date "end_date"
    t.string "reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_notes_on_employee_id"
    t.index ["event_id"], name: "index_notes_on_event_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "description"
    t.decimal "limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", force: :cascade do |t|
    t.string "description"
    t.integer "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_sectors_on_department_id"
  end

  create_table "situations", force: :cascade do |t|
    t.string "description"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "natures"
  add_foreign_key "employees", "roles"
  add_foreign_key "employees", "sectors"
  add_foreign_key "employees", "situations"
  add_foreign_key "financials", "competences"
  add_foreign_key "financials", "departments"
  add_foreign_key "financials", "employees"
  add_foreign_key "financials", "events"
  add_foreign_key "financials", "natures"
  add_foreign_key "financials", "roles"
  add_foreign_key "financials", "sectors"
  add_foreign_key "financials", "situations"
  add_foreign_key "notes", "employees"
  add_foreign_key "notes", "events"
  add_foreign_key "sectors", "departments"
end
