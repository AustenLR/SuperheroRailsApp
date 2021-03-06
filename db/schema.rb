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

ActiveRecord::Schema.define(version: 20151024191844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "superheros", force: :cascade do |t|
    t.string   "name"
    t.string   "image_url"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_superheros", force: :cascade do |t|
    t.integer  "superhero_id"
    t.integer  "team_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "team_superheros", ["superhero_id"], name: "index_team_superheros_on_superhero_id", using: :btree
  add_index "team_superheros", ["team_id"], name: "index_team_superheros_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "password_digest"
    t.boolean  "is_admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "team_superheros", "superheros"
  add_foreign_key "team_superheros", "teams"
end
