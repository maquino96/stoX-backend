# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_14_010814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "watchlist_id", null: false
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "upvotes"
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["watchlist_id"], name: "index_comments_on_watchlist_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "companyName"
    t.string "symbol"
    t.string "description"
    t.string "sector"
    t.string "industry"
    t.string "employees"
    t.string "ceo"
    t.string "exchange"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "onLoadWatchlist", default: "Default"
  end

  create_table "watch_stocks", force: :cascade do |t|
    t.bigint "watchlist_id", null: false
    t.bigint "stock_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_id"], name: "index_watch_stocks_on_stock_id"
    t.index ["watchlist_id"], name: "index_watch_stocks_on_watchlist_id"
  end

  create_table "watchlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.integer "upvotes", default: 0
    t.boolean "public"
    t.index ["user_id"], name: "index_watchlists_on_user_id"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "comments", "watchlists"
  add_foreign_key "watch_stocks", "stocks"
  add_foreign_key "watch_stocks", "watchlists"
  add_foreign_key "watchlists", "users"
end
