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

ActiveRecord::Schema.define(version: 2021_04_06_184038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.string "address"
    t.string "fiftyDayMovingAverage"
    t.string "fiftyTwoWeekHigh"
    t.string "fiftyTwoWeekLow"
    t.string "twoHundredDayMovingAverage"
    t.string "bookValue"
    t.string "description"
    t.string "dividendPerShare"
    t.string "dividendYield"
    t.string "ebitda"
    t.string "eps"
    t.string "fullTimeEmployees"
    t.string "grossPorditTTM"
    t.string "industry"
    t.string "marketCapitalization"
    t.string "peRatio"
    t.string "percentInsiders"
    t.string "percentInstitutions"
    t.string "priceToBookRatio"
    t.string "priceToSalesRatio"
    t.string "profitMargin"
    t.string "revenueTTM"
    t.string "sector"
    t.string "sharesFloat"
    t.string "sharesOutstanding"
    t.string "sharesShort"
    t.string "sharesShortPriorMonth"
    t.string "shortPercentFloat"
    t.string "shortPercentOutstanding"
    t.string "shortRatio"
    t.string "trailingPE"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "watchlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "stock_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_id"], name: "index_watchlists_on_stock_id"
    t.index ["user_id"], name: "index_watchlists_on_user_id"
  end

  add_foreign_key "watchlists", "stocks"
  add_foreign_key "watchlists", "users"
end
