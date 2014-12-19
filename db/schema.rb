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

ActiveRecord::Schema.define(version: 20141219225746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: true do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campaigns", ["name"], name: "index_campaigns_on_name", using: :btree
  add_index "campaigns", ["project_id"], name: "index_campaigns_on_project_id", using: :btree
  add_index "campaigns", ["user_id"], name: "index_campaigns_on_user_id", using: :btree

  create_table "contacts", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["first_name"], name: "index_contacts_on_first_name", using: :btree
  add_index "contacts", ["home_phone"], name: "index_contacts_on_home_phone", using: :btree
  add_index "contacts", ["last_name"], name: "index_contacts_on_last_name", using: :btree
  add_index "contacts", ["mobile_phone"], name: "index_contacts_on_mobile_phone", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "user_id"
    t.integer  "contact_id"
    t.integer  "messagable_id"
    t.string   "messagable_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["messagable_id", "messagable_type"], name: "index_messages_on_messagable_id_and_messagable_type", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["name"], name: "index_projects_on_name", using: :btree
  add_index "projects", ["slug"], name: "index_projects_on_slug", using: :btree
  add_index "projects", ["user_id", "created_at"], name: "index_projects_on_user_id_and_created_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
