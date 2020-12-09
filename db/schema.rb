# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_09_164524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locks", force: :cascade do |t|
    t.datetime "time"
    t.string "kind"
    t.string "status_change"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.bigint "server_id", null: false
    t.bigint "lock_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "time"
    t.index ["lock_id"], name: "index_registrations_on_lock_id"
    t.index ["server_id"], name: "index_registrations_on_server_id"
  end

  create_table "servers", force: :cascade do |t|
    t.string "code_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "registrations", "locks"
  add_foreign_key "registrations", "servers"
end
