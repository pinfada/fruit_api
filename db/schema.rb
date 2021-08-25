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

ActiveRecord::Schema.define(version: 2021_08_24_164211) do

  create_table "characteristics", force: :cascade do |t|
    t.string "unit"
    t.string "origine"
    t.string "certification"
    t.integer "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_characteristics_on_product_id"
  end

  create_table "cotations", force: :cascade do |t|
    t.date "cotation_date"
    t.integer "price_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["price_id"], name: "index_cotations_on_price_id"
    t.index ["product_id"], name: "index_cotations_on_product_id"
  end

  create_table "markets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "product_id"
  end

  create_table "prices", force: :cascade do |t|
    t.decimal "price", precision: 5, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "product_id", null: false
    t.index ["product_id"], name: "index_prices_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "market_id", null: false
    t.index ["market_id"], name: "index_products_on_market_id"
  end

  add_foreign_key "characteristics", "products"
  add_foreign_key "cotations", "prices"
  add_foreign_key "cotations", "products"
  add_foreign_key "prices", "products"
  add_foreign_key "products", "markets"
end
