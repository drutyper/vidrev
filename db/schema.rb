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

ActiveRecord::Schema.define(version: 20150812190355) do

  create_table "metacritics", force: :cascade do |t|
    t.string   "critic"
    t.integer  "score"
    t.text     "excerpt"
    t.string   "link"
    t.string   "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
  end

  add_index "metacritics", ["url"], name: "index_metacritics_on_url"

  create_table "twitches", force: :cascade do |t|
    t.string   "stream_id"
    t.string   "game"
    t.integer  "viewers"
    t.string   "preview"
    t.string   "links"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "search"
  end

  add_index "twitches", ["search"], name: "index_twitches_on_search"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "youtubes", force: :cascade do |t|
    t.string   "videoId"
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "query"
  end

  add_index "youtubes", ["query"], name: "index_youtubes_on_query"

end
