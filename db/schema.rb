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

ActiveRecord::Schema[7.0].define(version: 2023_08_18_150818) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guest_phone_numbers", force: :cascade do |t|
    t.bigint "guest_id"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_guest_phone_numbers_on_guest_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "guest_id"
    t.string "code"
    t.date "start_date"
    t.date "end_date"
    t.decimal "payout_price", precision: 10, scale: 2
    t.decimal "security_price", precision: 10, scale: 2
    t.string "currency"
    t.integer "number_of_nights"
    t.integer "number_of_guests"
    t.string "status"
    t.decimal "total_price", precision: 10, scale: 2
    t.integer "number_of_adults"
    t.integer "number_of_children"
    t.integer "number_of_infants"
    t.string "localized_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_reservations_on_guest_id"
  end

end
