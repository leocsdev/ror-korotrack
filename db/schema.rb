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

ActiveRecord::Schema[8.1].define(version: 2025_12_17_044017) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "attendance_dates", force: :cascade do |t|
    t.string "attendance_type", default: "ensayo", null: false
    t.datetime "created_at", null: false
    t.date "date", null: false
    t.datetime "updated_at", null: false
    t.index ["attendance_type"], name: "index_attendance_dates_on_attendance_type"
    t.index ["date"], name: "index_attendance_dates_on_date", unique: true
  end

  create_table "attendances", force: :cascade do |t|
    t.bigint "attendance_date_id", null: false
    t.datetime "created_at", null: false
    t.bigint "member_id", null: false
    t.string "status", null: false
    t.datetime "updated_at", null: false
    t.index ["attendance_date_id"], name: "index_attendances_on_attendance_date_id"
    t.index ["member_id", "attendance_date_id"], name: "index_attendances_on_member_and_date", unique: true
    t.index ["member_id"], name: "index_attendances_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.string "first_name", null: false
    t.string "kapisanan"
    t.string "last_name", null: false
    t.datetime "updated_at", null: false
    t.string "voice_part"
    t.index ["active"], name: "index_members_on_active"
  end

  add_foreign_key "attendances", "attendance_dates"
  add_foreign_key "attendances", "members"
end
