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

ActiveRecord::Schema[7.1].define(version: 2023_11_26_084017) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.index ["wedding_id"], name: "index_guests_on_wedding_id"
  end

  create_table "invitations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "wedding_id", null: false
    t.timestamptz "created_at", precision: 6, null: false
    t.timestamptz "updated_at", precision: 6, null: false
    t.index ["wedding_id"], name: "index_invitations_on_wedding_id"
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
  end

  add_foreign_key "event_services", "events", name: "event_fk_in_event_services"
  add_foreign_key "event_services", "services", name: "service_fk_in_event_services"
  add_foreign_key "events", "weddings", name: "wedding_fk_in_events"
  add_foreign_key "guests", "weddings"
  add_foreign_key "invitations", "weddings"
  add_foreign_key "services", "weddings", name: "wedding_fk_in_services"
end
