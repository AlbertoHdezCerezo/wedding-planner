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

ActiveRecord::Schema[7.1].define(version: 2024_02_21_072103) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "zip_code"
    t.string "town"
    t.string "country"
    t.string "state"
    t.timestamptz "created_at", precision: 6, null: false
    t.timestamptz "updated_at", precision: 6, null: false
  end

  create_table "dishes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "dietary_restrictions", default: [], null: false, array: true
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "EUR", null: false
    t.uuid "organization_id", null: false
    t.timestamptz "created_at", precision: 6, null: false
    t.timestamptz "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_dishes_on_organization_id"
  end

  create_table "event_guests", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "event_id", null: false
    t.uuid "guest_id", null: false
    t.timestamptz "created_at", precision: 6, null: false
    t.timestamptz "updated_at", precision: 6, null: false
    t.index ["event_id", "guest_id"], name: "event_guest_index_in_event_guests", unique: true
    t.index ["event_id"], name: "index_event_guests_on_event_id"
    t.index ["guest_id"], name: "index_event_guests_on_guest_id"
  end

  create_table "event_services", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "event_id", null: false
    t.uuid "service_id", null: false
    t.timestamptz "created_at", precision: 6, null: false
    t.timestamptz "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_services_on_event_id"
    t.index ["service_id"], name: "index_event_services_on_service_id"
  end

  create_table "events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "wedding_id", null: false
    t.string "name", null: false
    t.string "description"
    t.daterange "schedule", null: false
    t.boolean "planned", default: false, null: false
    t.timestamptz "created_at", precision: 6, null: false
    t.timestamptz "updated_at", precision: 6, null: false
    t.uuid "place_id"
    t.timestamptz "start_time"
    t.timestamptz "end_time"
    t.string "kind", null: false
    t.index ["place_id"], name: "index_events_on_place_id"
    t.index ["wedding_id"], name: "index_events_on_wedding_id"
  end

  create_table "guests", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "wedding_id", null: false
    t.timestamptz "invited_at", precision: 6
    t.timestamptz "confirmed_at", precision: 6
    t.timestamptz "cancelled_at", precision: 6
    t.timestamptz "created_at", precision: 6, null: false
    t.timestamptz "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "surname", null: false
    t.string "country", null: false
    t.uuid "invitation_id"
    t.index ["invitation_id"], name: "index_guests_on_invitation_id"
    t.index ["wedding_id"], name: "index_guests_on_wedding_id"
  end

  create_table "invitations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "wedding_id", null: false
    t.timestamptz "created_at", precision: 6, null: false
    t.timestamptz "updated_at", precision: 6, null: false
    t.string "state", default: "pending", null: false
    t.string "language", default: "en", null: false
    t.boolean "needs_travel_guide"
    t.index ["wedding_id"], name: "index_invitations_on_wedding_id"
  end

  create_table "menu_dishes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "menu_id", null: false
    t.uuid "dish_id", null: false
    t.timestamptz "created_at", precision: 6, null: false
    t.timestamptz "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_menu_dishes_on_dish_id"
    t.index ["menu_id"], name: "index_menu_dishes_on_menu_id"
  end

  create_table "menus", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.uuid "organization_id", null: false
    t.timestamptz "created_at", precision: 6, null: false
    t.timestamptz "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_menus_on_organization_id"
  end

  create_table "offers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "organization_id", null: false
    t.uuid "service_id", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "EUR", null: false
    t.timestamptz "created_at", precision: 6, null: false
    t.timestamptz "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_offers_on_organization_id"
    t.index ["service_id"], name: "index_offers_on_service_id"
  end

  create_table "organizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.timestamptz "created_at", precision: 6, null: false
    t.timestamptz "updated_at", precision: 6, null: false
  end

  create_table "places", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.uuid "address_id", null: false
    t.string "maps_url"
    t.string "phone"
    t.string "email"
    t.timestamptz "created_at", precision: 6, null: false
    t.timestamptz "updated_at", precision: 6, null: false
    t.uuid "wedding_id"
    t.index ["address_id"], name: "address_fk_in_places", unique: true
    t.index ["address_id"], name: "index_places_on_address_id"
    t.index ["name"], name: "name_index_in_places", unique: true
    t.index ["wedding_id"], name: "index_places_on_wedding_id"
  end

  create_table "services", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.uuid "wedding_id", null: false
    t.timestamptz "created_at", precision: 6, null: false
    t.timestamptz "updated_at", precision: 6, null: false
    t.index ["wedding_id"], name: "index_services_on_wedding_id"
  end

  create_table "weddings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.date "date"
    t.string "description"
    t.timestamptz "created_at", precision: 6, null: false
    t.timestamptz "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.uuid "opening_event_id"
    t.index ["opening_event_id"], name: "index_weddings_on_opening_event_id"
  end

  add_foreign_key "dishes", "organizations", name: "dish_fk_in_organization"
  add_foreign_key "event_guests", "events"
  add_foreign_key "event_guests", "guests"
  add_foreign_key "event_services", "events", name: "event_fk_in_event_services"
  add_foreign_key "event_services", "services", name: "service_fk_in_event_services"
  add_foreign_key "events", "places"
  add_foreign_key "events", "weddings", name: "wedding_fk_in_events"
  add_foreign_key "guests", "invitations"
  add_foreign_key "guests", "weddings"
  add_foreign_key "invitations", "weddings"
  add_foreign_key "menu_dishes", "dishes", name: "menu_dish_fk_in_dish"
  add_foreign_key "menu_dishes", "menus", name: "menu_dish_fk_in_menu"
  add_foreign_key "menus", "organizations", name: "menu_fk_in_organization"
  add_foreign_key "offers", "organizations", name: "offer_fk_in_organization"
  add_foreign_key "offers", "services", name: "offer_fk_in_service"
  add_foreign_key "places", "addresses"
  add_foreign_key "places", "weddings"
  add_foreign_key "services", "weddings", name: "wedding_fk_in_services"
  add_foreign_key "weddings", "events", column: "opening_event_id", name: "opening_event_fk_in_weddings"
end
