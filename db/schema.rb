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

ActiveRecord::Schema.define(version: 20150712222855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"
  enable_extension "hstore"

  create_table "bookings", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer  "number_of_person"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.text     "note"
    t.string   "site_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "status",            default: "requested"
    t.boolean  "partner_notified",  default: false
    t.boolean  "customer_notified", default: false
    t.datetime "datetime"
    t.integer  "gmt_offset",        default: 0
  end

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

  create_table "categories", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "site_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contents", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "page_id"
    t.integer  "order"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  create_table "designs", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "site_id"
    t.string   "title"
    t.string   "logo"
    t.string   "header_background_color"
    t.string   "header_title_color"
    t.string   "footer_background_color"
    t.string   "footer_title_color"
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

  create_table "images", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "file"
    t.integer  "type_id"
    t.string   "content_type"
    t.integer  "file_size"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "file_name"
  end

  create_table "pages", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "site_id"
    t.integer  "order"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "background"
    t.boolean  "enabled",     default: true
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

  create_table "product_images", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "image"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_id"
    t.string   "image_name"
    t.string   "product_id"
  end

  create_table "products", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "category_id"
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.float    "discount"
    t.string   "unit"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "site_id"
    t.string   "image_id"
    t.string   "image"
    t.string   "image_name"
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

  create_table "styles", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "site_id"
    t.string   "title"
    t.string   "logo"
    t.string   "header_background_color"
    t.string   "header_title_color"
    t.string   "footer_background_color"
    t.string   "footer_title_color"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end
