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

ActiveRecord::Schema.define(version: 20160429040350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brightsides", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "entry",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id",    null: false
    t.integer  "shine_id"
  end

  add_index "brightsides", ["shine_id"], name: "index_brightsides_on_shine_id", using: :btree
  add_index "brightsides", ["user_id"], name: "index_brightsides_on_user_id", using: :btree

  create_table "shines", force: :cascade do |t|
    t.string   "title",         null: false
    t.boolean  "completed",     null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "brightside_id"
  end

  add_index "shines", ["brightside_id"], name: "index_shines_on_brightside_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "remember_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "brightsides", "shines"
  add_foreign_key "brightsides", "users"
  add_foreign_key "shines", "brightsides"
end
