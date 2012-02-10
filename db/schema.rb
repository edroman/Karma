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

ActiveRecord::Schema.define(:version => 20120107015000) do

  create_table "emails", :force => true do |t|
    t.text     "subject"
    t.text     "body_html"
    t.text     "body_plain"
    t.boolean  "opened"
    t.boolean  "link_clicked"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "query_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "queries", :force => true do |t|
    t.integer  "user_id"
    t.text     "question"
    t.string   "status",     :default => "open"
    t.integer  "mentor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.binary   "image"
    t.string   "email"
    t.string   "member"
    t.boolean  "house_rules", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.string   "secret"
  end

end