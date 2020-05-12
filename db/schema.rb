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

ActiveRecord::Schema.define(version: 2020_05_12_071403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "kopis", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "origin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "price_per_pound", precision: 10, scale: 2
    t.bigint "roast_id", null: false
    t.index ["origin_id"], name: "index_kopis_on_origin_id"
    t.index ["roast_id"], name: "index_kopis_on_roast_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "weight", precision: 15, scale: 2, null: false
    t.bigint "kopi_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kopi_id"], name: "index_orders_on_kopi_id"
  end

  create_table "origins", force: :cascade do |t|
    t.string "location", null: false
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roasts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "kopis", "origins"
  add_foreign_key "kopis", "roasts"
  add_foreign_key "orders", "kopis"
end
