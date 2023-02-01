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

ActiveRecord::Schema[7.0].define(version: 2023_02_01_114801) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.float "price"
    t.integer "rooms"
    t.text "amenities"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "location"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_accommodations_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "itinerary_id", null: false
    t.bigint "transportation_id", null: false
    t.bigint "accommodation_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_bookings_on_accommodation_id"
    t.index ["itinerary_id"], name: "index_bookings_on_itinerary_id"
    t.index ["transportation_id"], name: "index_bookings_on_transportation_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "destination"
    t.date "departure_date"
    t.date "arrival_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.float "rate"
    t.text "comment"
    t.bigint "itinerary_id", null: false
    t.bigint "transportation_id", null: false
    t.bigint "accommodation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_reviews_on_accommodation_id"
    t.index ["itinerary_id"], name: "index_reviews_on_itinerary_id"
    t.index ["transportation_id"], name: "index_reviews_on_transportation_id"
  end

  create_table "transportations", force: :cascade do |t|
    t.time "departure_time"
    t.time "arrival_time"
    t.float "price"
    t.integer "seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "departure_location"
    t.string "arrival_location"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_transportations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accommodations", "users"
  add_foreign_key "bookings", "accommodations"
  add_foreign_key "bookings", "itineraries"
  add_foreign_key "bookings", "transportations"
  add_foreign_key "bookings", "users"
  add_foreign_key "itineraries", "users"
  add_foreign_key "reviews", "accommodations"
  add_foreign_key "reviews", "itineraries"
  add_foreign_key "reviews", "transportations"
  add_foreign_key "transportations", "users"
end
