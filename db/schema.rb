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

ActiveRecord::Schema.define(version: 2020_09_19_060315) do

  create_table "communicates", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "destination_id", null: false
    t.string "title"
    t.text "body"
    t.integer "is_opened", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "phone_number", null: false
    t.string "establishment"
    t.string "url"
    t.string "email", null: false
    t.string "zip_code"
    t.string "address_prefecture", null: false
    t.string "address_city"
    t.string "address_line1"
    t.string "address_line2"
    t.string "image_id"
    t.integer "is_active", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "introduction"
    t.string "i_image1_id"
    t.string "i_image2_id"
    t.text "future"
    t.string "f_image1_id"
    t.string "f_image2_id"
    t.index ["phone_number"], name: "index_companies_on_phone_number"
  end

  create_table "company_members", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "informations", force: :cascade do |t|
    t.integer "company_id", null: false
    t.text "introduction"
    t.string "i_image1_id"
    t.string "i_image2_id"
    t.text "future"
    t.string "f_image1_id"
    t.string "f_image2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "introduction"
    t.text "future"
    t.integer "employment_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "talk_rooms", force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id", "user_id"], name: "index_talk_rooms_on_company_id_and_user_id", unique: true
  end

  create_table "talks", force: :cascade do |t|
    t.integer "talk_room_id", null: false
    t.integer "user_id", null: false
    t.text "body"
    t.integer "is_opened", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "nic_name", null: false
    t.string "birthday"
    t.string "zip_code"
    t.string "address_prefecture_name"
    t.string "address_city"
    t.string "address_line1"
    t.string "address_line2"
    t.string "phone_number"
    t.integer "permissions", default: 0, null: false
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sex", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.integer "company_id", null: false
    t.text "introduction"
    t.text "job_details"
    t.string "image_id"
    t.integer "is_active", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.string "title"
  end

end
