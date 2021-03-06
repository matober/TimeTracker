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

ActiveRecord::Schema.define(version: 20170425181616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "total_time",  default: 0
    t.string   "a_name"
    t.boolean  "hidden"
    t.datetime "date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "category_id"
    t.integer  "priority"
    t.integer  "user_id"
    t.index ["category_id"], name: "index_activities_on_category_id", using: :btree
    t.index ["user_id"], name: "index_activities_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "c_name"
    t.integer  "num_of_act"
    t.integer  "user_id"
    t.integer  "category_id"
    t.index ["category_id"], name: "index_categories_on_category_id", using: :btree
    t.index ["user_id"], name: "index_categories_on_user_id", using: :btree
  end

  create_table "user_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "persistence_token"
    t.string   "crypted_password"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "perishable_token"
  end

  add_foreign_key "activities", "categories"
  add_foreign_key "activities", "users"
  add_foreign_key "categories", "categories"
  add_foreign_key "categories", "users"
end
