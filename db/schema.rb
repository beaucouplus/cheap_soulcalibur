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

ActiveRecord::Schema.define(version: 20180305101436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "features", force: :cascade do |t|
    t.string "feature_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "featurings", force: :cascade do |t|
    t.bigint "feature_id"
    t.bigint "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_featurings_on_feature_id"
    t.index ["player_id"], name: "index_featurings_on_player_id"
  end

  create_table "fights", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_1"
    t.integer "player_2"
    t.integer "winner"
    t.text "summary"
    t.integer "weapon_1"
    t.integer "weapon_2"
  end

  create_table "players", force: :cascade do |t|
    t.string "player_name"
    t.integer "life_points"
    t.integer "attack_points"
    t.integer "experience", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "victories", default: 0
    t.integer "defeats", default: 0
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "bonus_damage"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "featurings", "features"
  add_foreign_key "featurings", "players"
end
