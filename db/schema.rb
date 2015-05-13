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

ActiveRecord::Schema.define(version: 20150513141956) do

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

  create_table "contents", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "page_id"
    t.integer  "order"
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
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

  create_table "pages", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "site_id"
    t.integer  "order"
    t.string   "title"
    t.string   "description"
    t.string   "background_url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "background"
  end

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
