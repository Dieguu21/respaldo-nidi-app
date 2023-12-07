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

ActiveRecord::Schema.define(version: 2022_05_21_035523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "turn_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "mensajes"
    t.index ["turn_id"], name: "index_chats_on_turn_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "turn_id", null: false
    t.text "content"
    t.integer "stars", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["turn_id"], name: "index_ratings_on_turn_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "turn_id", null: false
    t.string "status"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["turn_id"], name: "index_requests_on_turn_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "turns", force: :cascade do |t|
    t.integer "max_space"
    t.integer "av_space"
    t.string "origin"
    t.string "destination"
    t.date "date"
    t.time "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "last_name"
    t.integer "phone"
    t.string "patent"
    t.string "car_color"
    t.text "description"
    t.integer "stars", default: 0
    t.binary "image"
    t.boolean "is_admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chats", "turns"
  add_foreign_key "chats", "users"
  add_foreign_key "ratings", "turns"
  add_foreign_key "ratings", "users"
  add_foreign_key "requests", "turns"
  add_foreign_key "requests", "users"
end
