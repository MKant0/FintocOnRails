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

ActiveRecord::Schema[7.0].define(version: 2023_08_02_154723) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_balances", force: :cascade do |t|
    t.integer "available"
    t.integer "current"
    t.integer "limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.string "object"
    t.string "name"
    t.string "official_name"
    t.string "number"
    t.string "holder_id"
    t.string "holder_name"
    t.string "type"
    t.string "currency"
    t.string "refreshed_at"
    t.integer "id_account_balance"
    t.integer "id_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exchange_tokens", force: :cascade do |t|
    t.string "token"
    t.bigint "link_intent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_intent_id"], name: "index_exchange_tokens_on_link_intent_id"
  end

  create_table "link_accounts", force: :cascade do |t|
    t.string "object"
    t.string "name"
    t.string "official_name"
    t.string "number"
    t.string "holder_id"
    t.string "holder_name"
    t.string "type"
    t.string "currency"
    t.string "refreshed_at"
    t.integer "id_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "link_institutions", force: :cascade do |t|
    t.string "country"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "link_intents", force: :cascade do |t|
    t.string "widget_token"
    t.string "exchange_token"
    t.string "object"
    t.string "country"
    t.string "holder_type"
    t.string "product"
    t.string "mode"
    t.string "exchange_token_expires_at"
    t.string "status"
    t.integer "id_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string "object"
    t.string "username"
    t.string "holder_id"
    t.string "link_token"
    t.string "holder_type"
    t.string "mode"
    t.boolean "active"
    t.string "status"
    t.integer "id_link_institution"
    t.integer "id_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movement_recipient_accounts", force: :cascade do |t|
    t.string "holder_id"
    t.string "holder_name"
    t.string "number"
    t.integer "id_movement_recipient_institution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movement_recipient_institutions", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movement_sender_accounts", force: :cascade do |t|
    t.string "holder_id"
    t.string "holder_name"
    t.string "number"
    t.integer "id_movement_sender_institution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movement_sender_institutions", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movements", force: :cascade do |t|
    t.string "object"
    t.integer "amount"
    t.string "post_date"
    t.string "description"
    t.string "transaction_date"
    t.string "currency"
    t.string "reference_id"
    t.string "type"
    t.boolean "pending"
    t.string "comment"
    t.integer "id_movement_recipient_account"
    t.integer "id_movement_sender_account"
    t.integer "id_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_intents", force: :cascade do |t|
    t.string "object"
    t.integer "amount"
    t.string "currency"
    t.string "widget_token"
    t.string "status"
    t.string "reference_id"
    t.string "transaction_date"
    t.string "error_reason"
    t.string "mode"
    t.integer "id_payment_recipient_account"
    t.integer "id_payment_sender_account"
    t.integer "id_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_recipient_accounts", force: :cascade do |t|
    t.string "holder_id"
    t.string "number"
    t.string "type"
    t.string "institution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_sender_accounts", force: :cascade do |t|
    t.string "holder_id"
    t.string "number"
    t.string "type"
    t.string "institution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_of_birth"
    t.string "country"
    t.string "phone"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "exchange_tokens", "link_intents"
end
