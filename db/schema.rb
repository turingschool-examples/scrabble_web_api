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

ActiveRecord::Schema.define(version: 20180912152719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.bigint "player_1_id"
    t.bigint "player_2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_1_id"], name: "index_games_on_player_1_id"
    t.index ["player_2_id"], name: "index_games_on_player_2_id"
  end

  create_table "plays", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "game_id"
    t.string "word"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_plays_on_game_id"
    t.index ["user_id"], name: "index_plays_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.string "content"
  end

  add_foreign_key "games", "users", column: "player_1_id"
  add_foreign_key "games", "users", column: "player_2_id"
  add_foreign_key "plays", "games"
  add_foreign_key "plays", "users"
end
