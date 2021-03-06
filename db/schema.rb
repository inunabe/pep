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

ActiveRecord::Schema.define(version: 20180329014911) do

  create_table "answers", force: :cascade do |t|
    t.integer  "answering_user_id", limit: 4
    t.integer  "answered_user_id",  limit: 4
    t.integer  "question_id",       limit: 4
    t.integer  "rate",              limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "period_id",         limit: 4
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grade_questions", force: :cascade do |t|
    t.integer  "grade_id",    limit: 4
    t.integer  "question_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "grade_questions", ["grade_id"], name: "index_grade_questions_on_grade_id", using: :btree
  add_index "grade_questions", ["question_id"], name: "index_grade_questions_on_question_id", using: :btree

  create_table "grades", force: :cascade do |t|
    t.integer  "department_id", limit: 4
    t.integer  "rank",          limit: 4, default: 1
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "performance_rates", force: :cascade do |t|
    t.integer  "rate",           limit: 4
    t.integer  "performance_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "period_id",      limit: 4
  end

  create_table "performances", force: :cascade do |t|
    t.string   "item",       limit: 255
    t.integer  "weight",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "grade_id",   limit: 4
  end

  create_table "periods", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.date     "start_date"
    t.date     "finish_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
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
    t.integer  "weight",     limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",            limit: 255,             null: false
    t.string   "crypted_password", limit: 255
    t.string   "salt",             limit: 255
    t.string   "name",             limit: 255
    t.integer  "role",             limit: 4,   default: 0
    t.integer  "superior_id",      limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "grade_id",         limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "grade_questions", "grades"
  add_foreign_key "grade_questions", "questions"
end
