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

ActiveRecord::Schema.define(version: 20180202141109) do

  create_table "answers", force: :cascade do |t|
    t.integer  "answering_user_id", limit: 4
    t.integer  "answered_user_id",  limit: 4
    t.integer  "question_id",       limit: 4
    t.integer  "rate",              limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_alternatives", force: :cascade do |t|
    t.text     "text",        limit: 65535
    t.integer  "question_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rate",        limit: 4
  end

  create_table "questions", force: :cascade do |t|
    t.text     "text",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",            limit: 255,             null: false
    t.string   "crypted_password", limit: 255
    t.string   "salt",             limit: 255
    t.string   "name",             limit: 255
    t.integer  "role",             limit: 4,   default: 0
    t.integer  "department_id",    limit: 4
    t.integer  "superior_id",      limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
