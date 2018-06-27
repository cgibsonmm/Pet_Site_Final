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

ActiveRecord::Schema.define(version: 20180627183547) do

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "dob"
    t.string "species"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "medical_history"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "image_original_w"
    t.integer "image_original_h"
    t.integer "image_crop_x"
    t.integer "imgae_crop_y"
    t.integer "image_crop_h"
    t.integer "image_crop_w"
    t.index ["user_id"], name: "index_animals_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "photo_post_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_post_id"], name: "index_comments_on_photo_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "photo_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photo_posts", force: :cascade do |t|
    t.string "caption"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "image_original_w"
    t.integer "image_original_h"
    t.integer "image_crop_x"
    t.integer "image_crop_y"
    t.integer "image_crop_w"
    t.integer "image_crop_h"
    t.index ["user_id"], name: "index_photo_posts_on_user_id"
  end

  create_table "shot_records", force: :cascade do |t|
    t.integer "animal_id"
    t.string "name"
    t.date "due_date"
    t.date "date_recived"
    t.integer "frequency"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_shot_records_on_animal_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "first_name"
    t.string "last_name"
    t.integer "zip_code"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "birthday"
    t.string "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
    t.index ["zip_code"], name: "index_user_profiles_on_zip_code"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

end
