# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_03_001528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coupons", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.integer "discount", null: false
    t.boolean "is_used", default: false, null: false
    t.datetime "expired_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_coupons_on_user_id"
  end

  create_table "game_tickets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "is_used", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_game_tickets_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.integer "count", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "receipt_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["receipt_id"], name: "index_orders_on_receipt_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "shop_id", null: false
    t.string "name", null: false
    t.text "description", null: false
    t.integer "price", null: false
    t.integer "price_tax", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_products_on_shop_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.text "description", null: false
    t.string "content1", null: false
    t.string "content2", null: false
    t.string "content3", null: false
    t.integer "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shop_id", null: false
    t.bigint "product_id", null: false
    t.bigint "coupon_id"
    t.integer "price", null: false
    t.integer "price_tax", null: false
    t.boolean "is_used", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coupon_id"], name: "index_receipts_on_coupon_id"
    t.index ["product_id"], name: "index_receipts_on_product_id"
    t.index ["shop_id"], name: "index_receipts_on_shop_id"
    t.index ["user_id"], name: "index_receipts_on_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "system_admins", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "display_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "coupons", "users"
  add_foreign_key "game_tickets", "users"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "receipts"
  add_foreign_key "products", "shops"
  add_foreign_key "receipts", "coupons"
  add_foreign_key "receipts", "products"
  add_foreign_key "receipts", "shops"
  add_foreign_key "receipts", "users"
end
