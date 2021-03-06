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

ActiveRecord::Schema.define(version: 2019_08_21_180157) do

  create_table "cats", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.string "description"
    t.integer "scraggliness"
    t.integer "hunger"
    t.integer "lives"
    t.integer "user_id"
    t.string "img_url"
    t.integer "days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "posh_event"
    t.integer "hazard_rating"
    t.integer "neighborhood_id"
    t.integer "scraggliness_score"
    t.integer "hunger_score"
    t.integer "lives_score"
    t.string "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cred_score"
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "poshness"
    t.integer "neighborhood_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "danger_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "event_cooldown", default: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "cat_id"
    t.integer "family_id"
    t.integer "affection"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "territories", force: :cascade do |t|
    t.integer "cat_id"
    t.integer "neighborhood_id"
    t.integer "cat_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
