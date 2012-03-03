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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120303061810) do

  create_table "families", :force => true do |t|
    t.string   "family_name"
    t.string   "parent_names"
    t.string   "street_address"
    t.string   "postal_code"
    t.string   "city"
    t.string   "primary_email"
    t.string   "secondary_email"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.text     "notes"
    t.integer  "status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "first_name"
    t.string   "family_name"
    t.integer  "family_id"
    t.date     "birthday"
    t.string   "gender"
    t.boolean  "custom_contact_details"
    t.string   "street_address"
    t.string   "city"
    t.string   "postal_code"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "primary_email"
    t.string   "secondary_email"
    t.text     "notes"
    t.integer  "status"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
