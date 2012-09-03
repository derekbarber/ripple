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

ActiveRecord::Schema.define(:version => 20120903183814) do

  create_table "families", :force => true do |t|
    t.string   "family_name"
    t.string   "parent_names"
    t.string   "street_address"
    t.string   "postal_code"
    t.string   "city"
    t.string   "primary_email"
    t.string   "secondary_email"
    t.string   "phone_number1"
    t.string   "phone_number2"
    t.text     "notes"
    t.integer  "status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "phone_number3"
    t.string   "phone_number4"
    t.string   "third_email"
  end

  create_table "instruments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lessons", :force => true do |t|
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.integer  "instrument_id"
    t.string   "day_of_week"
    t.time     "start_time"
    t.time     "end_time"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "status"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "student_instrument_id"
  end

  create_table "preferred_teachers", :force => true do |t|
    t.integer  "student_instrument_id"
    t.integer  "teacher_id"
    t.integer  "order_of_preference"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "resound_processes", :force => true do |t|
    t.integer  "student_id"
    t.boolean  "schedule_assessment"
    t.text     "schedule_assessment_note"
    t.date     "schedule_assessment_due"
    t.boolean  "confirm_payment"
    t.text     "confirm_payment_note"
    t.date     "confirm_payment_due"
    t.boolean  "upload_assessment"
    t.text     "upload_assessment_note"
    t.date     "upload_assessment_due"
    t.boolean  "schedule_lessons"
    t.text     "schedule_lessons_note"
    t.date     "schedule_lessons_due"
    t.boolean  "welcome_email"
    t.text     "welcome_email_note"
    t.date     "welcome_email_due"
    t.boolean  "email_assessment"
    t.text     "email_assessment_note"
    t.date     "email_assessment_due"
    t.boolean  "next_day_followup"
    t.text     "next_day_followup_note"
    t.date     "next_day_followup_due"
    t.boolean  "one_month_followup"
    t.text     "one_month_followup_note"
    t.date     "one_month_followup_due"
    t.boolean  "four_month_followup"
    t.text     "four_month_followup_note"
    t.date     "four_month_followup_due"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.date     "assessment_date"
  end

  create_table "student_availabilities", :force => true do |t|
    t.integer  "student_id"
    t.string   "day_of_week"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "preferred_time"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "student_instruments", :force => true do |t|
    t.integer  "student_id"
    t.integer  "instrument_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "lesson_duration"
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
    t.string   "phone_number1"
    t.string   "phone_number2"
    t.string   "primary_email"
    t.string   "secondary_email"
    t.text     "notes"
    t.integer  "status"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "phone_number3"
    t.string   "phone_number4"
    t.string   "assessment_form"
    t.string   "bank_authorization"
    t.string   "third_email"
  end

  create_table "teacher_availabilities", :force => true do |t|
    t.integer  "teacher_id"
    t.string   "day_of_week"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "custom_start_location"
    t.string   "start_address"
    t.string   "start_city"
    t.string   "start_postal_code"
    t.boolean  "custom_end_location"
    t.string   "end_address"
    t.string   "end_city"
    t.string   "end_postal_code"
    t.boolean  "available_surrey"
    t.boolean  "available_whiterock"
    t.boolean  "available_langley"
    t.boolean  "available_aldergrove"
    t.boolean  "available_abbotsford"
    t.boolean  "available_newwest"
    t.boolean  "available_poco"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "teacher_instruments", :force => true do |t|
    t.integer  "teacher_id"
    t.integer  "instrument_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "teachers", :force => true do |t|
    t.string   "first_name"
    t.string   "family_name"
    t.string   "gender"
    t.string   "email"
    t.string   "street_address"
    t.string   "city"
    t.string   "postal_code"
    t.string   "phone_number1"
    t.string   "phone_number2"
    t.string   "secondary_email"
    t.text     "notes"
    t.integer  "status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "phone_number3"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "admin"
    t.integer  "teacher_id"
    t.boolean  "status"
  end

end
