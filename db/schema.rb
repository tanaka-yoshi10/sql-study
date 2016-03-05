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

ActiveRecord::Schema.define(version: 20160304235659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_purchasings", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "book_purchasings", ["book_id"], name: "index_book_purchasings_on_book_id", using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "discussion_id"
    t.string   "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "comments", ["discussion_id"], name: "index_comments_on_discussion_id", using: :btree

  create_table "deposit_transactions", force: :cascade do |t|
    t.date     "occurred_on"
    t.integer  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "discussions", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_participations", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "member_id"
    t.boolean  "canceled",   default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "event_participations", ["event_id"], name: "index_event_participations_on_event_id", using: :btree
  add_index "event_participations", ["member_id"], name: "index_event_participations_on_member_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_dislikings", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "food_dislikings", ["food_id"], name: "index_food_dislikings_on_food_id", using: :btree
  add_index "food_dislikings", ["profile_id"], name: "index_food_dislikings_on_profile_id", using: :btree

  create_table "food_likings", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "food_likings", ["food_id"], name: "index_food_likings_on_food_id", using: :btree
  add_index "food_likings", ["profile_id"], name: "index_food_likings_on_profile_id", using: :btree

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_purchasings", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "purchased_at"
    t.string   "user_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "game_purchasings", ["game_id"], name: "index_game_purchasings_on_game_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "content"
    t.date     "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id", using: :btree

  add_foreign_key "book_purchasings", "books"
  add_foreign_key "comments", "discussions"
  add_foreign_key "event_participations", "events"
  add_foreign_key "event_participations", "members"
  add_foreign_key "food_dislikings", "foods"
  add_foreign_key "food_dislikings", "profiles"
  add_foreign_key "food_likings", "foods"
  add_foreign_key "food_likings", "profiles"
  add_foreign_key "game_purchasings", "games"
  add_foreign_key "tasks", "projects"
end
