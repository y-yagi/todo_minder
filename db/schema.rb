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

ActiveRecord::Schema.define(version: 20160603040314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lists", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id", using: :btree
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "detail",                  null: false
    t.integer  "list_id"
    t.integer  "user_id"
    t.datetime "deadline_at"
    t.integer  "point"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "tags",                                 array: true
    t.integer  "status",      default: 0, null: false
    t.index ["list_id"], name: "index_tasks_on_list_id", using: :btree
    t.index ["tags"], name: "index_tasks_on_tags", using: :gin
    t.index ["user_id"], name: "index_tasks_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid",                                  null: false
    t.string   "provider",                             null: false
    t.string   "name",                                 null: false
    t.string   "email"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "notification",         default: false
    t.string   "pushbullet_api_token"
  end

  add_foreign_key "lists", "users"
  add_foreign_key "tasks", "lists"
  add_foreign_key "tasks", "users"
end
