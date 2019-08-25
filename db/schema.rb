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

ActiveRecord::Schema.define(version: 20190825023500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", default: 0, null: false
    t.bigint "micropost_id", default: 0, null: false
    t.string "comment", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["micropost_id"], name: "index_comments_on_micropost_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", default: 0, null: false
    t.bigint "micropost_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["micropost_id"], name: "index_favorites_on_micropost_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "microposts", force: :cascade do |t|
    t.text "content", default: "", null: false
    t.bigint "user_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", default: 0, null: false
    t.text "introduction", default: "", null: false
    t.string "user_image", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "following_id", default: 0, null: false
    t.integer "follower_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.bigint "micropost_id", default: 0, null: false
    t.string "description", default: "", null: false
    t.string "image", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["micropost_id"], name: "index_topics_on_micropost_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "microposts"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "microposts"
  add_foreign_key "favorites", "users"
  add_foreign_key "microposts", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "topics", "microposts"
end
