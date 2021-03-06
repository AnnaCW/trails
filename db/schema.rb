# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160604004507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "tags_trails", id: false, force: :cascade do |t|
    t.integer "trail_id", null: false
    t.integer "tag_id",   null: false
  end

  add_index "tags_trails", ["tag_id"], name: "index_tags_trails_on_tag_id", using: :btree
  add_index "tags_trails", ["trail_id"], name: "index_tags_trails_on_trail_id", using: :btree

  create_table "trails", force: :cascade do |t|
    t.string   "name"
    t.string   "image_path"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.integer  "user_id"
  end

  add_index "trails", ["user_id"], name: "index_trails_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role",            default: 0
  end

  add_foreign_key "trails", "users"
end
