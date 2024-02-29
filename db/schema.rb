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

ActiveRecord::Schema[7.1].define(version: 2024_02_28_012844) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "name", null: false
    t.string "api_reference"
  end

  create_table "currency_accounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "currency_id", null: false
    t.float "balance", default: 0.0
    t.index ["currency_id"], name: "index_currency_accounts_on_currency_id"
    t.index ["user_id"], name: "index_currency_accounts_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "currency_from_id", null: false
    t.bigint "currency_to_id", null: false
    t.float "amount_from", null: false
    t.float "amount_to", null: false
    t.index ["currency_from_id"], name: "index_transactions_on_currency_from_id"
    t.index ["currency_to_id"], name: "index_transactions_on_currency_to_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
  end

  add_foreign_key "currency_accounts", "currencies"
  add_foreign_key "currency_accounts", "users"
  add_foreign_key "transactions", "currencies", column: "currency_from_id"
  add_foreign_key "transactions", "currencies", column: "currency_to_id"
  add_foreign_key "transactions", "users"
end
