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

ActiveRecord::Schema.define(version: 20150318002123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"
  enable_extension "hstore"

  create_table "businesses", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "site_id",    default: "", null: false
    t.string   "name",       default: ""
    t.string   "email",      default: ""
    t.string   "phone",      default: ""
    t.string   "address",    default: ""
    t.string   "city",       default: ""
    t.string   "state",      default: ""
    t.string   "postcode",   default: ""
    t.string   "country",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "hours", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "business_id",              null: false
    t.string   "day",                      null: false
    t.integer  "start_time",               null: false
    t.integer  "end_time",                 null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "text",        default: ""
  end

  create_table "partners", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "company"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "salt"
  end

  add_index "partners", ["company"], name: "index_partners_on_company", unique: true, using: :btree
  add_index "partners", ["email"], name: "index_partners_on_email", unique: true, using: :btree
  add_index "partners", ["reset_password_token"], name: "index_partners_on_reset_password_token", unique: true, using: :btree
  add_index "partners", ["username"], name: "index_partners_on_username", unique: true, using: :btree

  create_table "sites", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "domain"
    t.string   "partner_id"
    t.string   "layout_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "app_url"
    t.text     "description", default: ""
    t.string   "status",      default: "development"
  end

end
