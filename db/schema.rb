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

ActiveRecord::Schema.define(:version => 20130308185510) do

  create_table "household_account_categories", :force => true do |t|
    t.string   "category_id"
    t.string   "category_text"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "household_account_payments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "household_account_category_id"
    t.integer  "household_account_shop_id"
    t.string   "payment_text"
    t.decimal  "sum",                           :precision => 7, :scale => 2
    t.date     "payment_date"
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
  end

  create_table "household_account_shops", :force => true do |t|
    t.string   "shop_id"
    t.string   "shop_text"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notes", :force => true do |t|
    t.string   "note_id"
    t.text     "note_text"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "last_logon"
    t.string   "last_logon_ip"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
