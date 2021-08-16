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

ActiveRecord::Schema.define(version: 2021_07_28_173851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "application_reviews", force: :cascade do |t|
    t.bigint "convention_id", null: false
    t.bigint "event_application_id", null: false
    t.bigint "user_id", null: false
    t.integer "feasibility"
    t.integer "relevance"
    t.integer "structure"
    t.integer "fun_factor"
    t.integer "style"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["convention_id"], name: "index_application_reviews_on_convention_id"
    t.index ["event_application_id"], name: "index_application_reviews_on_event_application_id"
    t.index ["user_id"], name: "index_application_reviews_on_user_id"
  end

  create_table "conventions", force: :cascade do |t|
    t.integer "year"
    t.string "address"
    t.text "description"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.string "panel_soft_cap"
    t.date "panel_soft_cap_date"
    t.date "panel_hard_cap_date"
    t.boolean "panel_cap_reached"
    t.index ["slug"], name: "index_conventions_on_slug", unique: true
  end

  create_table "event_applications", force: :cascade do |t|
    t.string "event_name"
    t.string "internal_desc"
    t.string "external_desc"
    t.string "host_stage_name"
    t.string "age_rating"
    t.boolean "agreed_to_terms"
    t.string "event_length"
    t.boolean "previous_convention"
    t.integer "application_score"
    t.integer "application_status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "convention_id", null: false
    t.string "slug"
    t.index ["convention_id"], name: "index_event_applications_on_convention_id"
    t.index ["slug"], name: "index_event_applications_on_slug", unique: true
    t.index ["user_id"], name: "index_event_applications_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "event_name"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.text "internal_desc"
    t.text "external_desc"
    t.integer "status"
    t.string "slug"
    t.bigint "convention_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "age_rating"
    t.index ["convention_id"], name: "index_events_on_convention_id"
    t.index ["slug"], name: "index_events_on_slug"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "time_choices", force: :cascade do |t|
    t.bigint "event_application_id", null: false
    t.integer "fri_8_to_11"
    t.integer "fri_11_to_14"
    t.integer "fri_14_to_17"
    t.integer "fri_17_to_20"
    t.integer "fri_20_to_23"
    t.integer "fri_23_to_2"
    t.integer "sat_8_to_11"
    t.integer "sat_11_to_14"
    t.integer "sat_14_to_17"
    t.integer "sat_17_to_20"
    t.integer "sat_20_to_23"
    t.integer "sat_23_to_2"
    t.integer "sun_8_to_11"
    t.integer "sun_11_to_14"
    t.integer "sun_14_to_17"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_application_id"], name: "index_time_choices_on_event_application_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "application_reviews", "conventions"
  add_foreign_key "application_reviews", "event_applications"
  add_foreign_key "application_reviews", "users"
  add_foreign_key "event_applications", "conventions"
  add_foreign_key "event_applications", "users"
  add_foreign_key "events", "conventions"
  add_foreign_key "events", "users"
  add_foreign_key "time_choices", "event_applications"
end
