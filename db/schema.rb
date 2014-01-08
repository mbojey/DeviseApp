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

ActiveRecord::Schema.define(version: 20140108061859) do

  create_table "games", force: true do |t|
    t.integer "game_id",  default: 0, null: false
    t.integer "user_id",  default: 0, null: false
    t.integer "topic_id", default: 0, null: false
    t.integer "number",   default: 0, null: false
    t.integer "correct",  default: 0, null: false
    t.string  "name"
  end

  create_table "practices", force: true do |t|
    t.integer "game_id",     default: 0,     null: false
    t.integer "practice_id", default: 0,     null: false
    t.integer "user_id",     default: 0,     null: false
    t.integer "question_id", default: 0,     null: false
    t.integer "topic_id",    default: 0,     null: false
    t.integer "attempts",    default: 0,     null: false
    t.integer "answer"
    t.boolean "correct",     default: false, null: false
  end

  create_table "questions", force: true do |t|
    t.text     "qtext",          limit: 255
    t.text     "a1text",         limit: 255
    t.text     "a2text",         limit: 255
    t.text     "a3text",         limit: 255
    t.text     "a4text",         limit: 255
    t.text     "a5text",         limit: 255
    t.integer  "answer"
    t.integer  "user_id",                    default: 0,     null: false
    t.integer  "question_id",                default: 0,     null: false
    t.integer  "topic_id",                   default: 0,     null: false
    t.boolean  "submitted",                  default: false, null: false
    t.text     "grade",          limit: 255, default: "",    null: false
    t.boolean  "visible",                    default: true,  null: false
    t.boolean  "exam",                       default: false, null: false
    t.string   "lab"
    t.datetime "date_submitted"
  end

  create_table "results", force: true do |t|
    t.string "name"
    t.string "lab"
  end

  create_table "topics", force: true do |t|
    t.string  "name"
    t.integer "topic_id", default: 0, null: false
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.integer  "user_id",                default: 0,     null: false
    t.string   "email",                  default: "",    null: false
    t.boolean  "assistant",              default: false
    t.boolean  "instructor",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "fname"
    t.string   "lname"
    t.string   "lab"
    t.integer  "studentnumber"
  end

end
