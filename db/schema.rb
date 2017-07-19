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

ActiveRecord::Schema.define(version: 20170719022947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.float "lat"
    t.float "lng"
    t.string "place_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.bigint "trips_id"
    t.bigint "places_id"
    t.date "date"
    t.index ["places_id"], name: "index_itineraries_on_places_id"
    t.index ["trips_id"], name: "index_itineraries_on_trips_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "google_place_id"
    t.string "name"
    t.float "lat"
    t.float "lng"
  end

  create_table "tours", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "price"
    t.float "average_rating"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tours_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id"
    t.string "start_city"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_trips_on_city_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.integer "status", default: 0
    t.integer "role", default: 0
    t.string "verification_code"
  end

  add_foreign_key "itineraries", "places", column: "places_id"
  add_foreign_key "itineraries", "trips", column: "trips_id"
  add_foreign_key "tours", "users"
  add_foreign_key "trips", "cities"
  add_foreign_key "trips", "users"
end
