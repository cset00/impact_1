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

ActiveRecord::Schema.define(version: 2018_10_13_104256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.boolean "active"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "events", force: :cascade do |t|
    t.string "subject"
    t.text "description"
    t.boolean "cancelled"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date_time"
    t.text "address"
    t.bigint "admin_user_id"
    t.index ["admin_user_id"], name: "index_events_on_admin_user_id"
  end

  create_table "reg_users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "school"
    t.string "suburb"
    t.boolean "active_sub"
    t.integer "contact_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rsvps", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "reg_user_id"
    t.boolean "active"
    t.boolean "attended"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_rsvps_on_event_id"
    t.index ["reg_user_id"], name: "index_rsvps_on_reg_user_id"
  end

  add_foreign_key "events", "admin_users"
  add_foreign_key "rsvps", "events"
  add_foreign_key "rsvps", "reg_users"
end
