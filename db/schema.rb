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

ActiveRecord::Schema.define(version: 20161203171208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "character_base_experiences", force: :cascade do |t|
    t.integer "character_base_id"
    t.integer "experience_id"
    t.integer "location_id"
    t.integer "likelihood"
    t.index ["character_base_id"], name: "index_character_base_experiences_on_character_base_id", using: :btree
    t.index ["experience_id"], name: "index_character_base_experiences_on_experience_id", using: :btree
    t.index ["location_id"], name: "index_character_base_experiences_on_location_id", using: :btree
  end

  create_table "character_base_locations", force: :cascade do |t|
    t.integer "character_id"
    t.integer "location_id"
    t.index ["character_id"], name: "index_character_base_locations_on_character_id", using: :btree
    t.index ["location_id"], name: "index_character_base_locations_on_location_id", using: :btree
  end

  create_table "character_bases", force: :cascade do |t|
    t.string  "nickname"
    t.string  "description"
    t.string  "gender"
    t.integer "starting_money"
    t.integer "starting_fear"
    t.integer "starting_health"
    t.integer "starting_age"
    t.integer "starting_chutzpah"
    t.integer "brexit_factor_change"
  end

  create_table "character_experiences", force: :cascade do |t|
    t.integer  "experience_id"
    t.integer  "character_id"
    t.integer  "instigator_id"
    t.boolean  "is_active",     default: true
    t.integer  "when"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["character_id"], name: "index_character_experiences_on_character_id", using: :btree
    t.index ["experience_id"], name: "index_character_experiences_on_experience_id", using: :btree
    t.index ["instigator_id"], name: "index_character_experiences_on_instigator_id", using: :btree
  end

  create_table "characters", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "character_base_id"
    t.string   "name"
    t.integer  "money"
    t.integer  "fear"
    t.integer  "health"
    t.integer  "age"
    t.integer  "chutzpah"
    t.integer  "brexit_factor"
    t.boolean  "is_alive",          default: true
    t.integer  "location_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["character_base_id"], name: "index_characters_on_character_base_id", using: :btree
    t.index ["location_id"], name: "index_characters_on_location_id", using: :btree
    t.index ["user_id"], name: "index_characters_on_user_id", using: :btree
  end

  create_table "currencies", force: :cascade do |t|
    t.string  "name"
    t.float   "exchange_rate"
    t.integer "ease_of_use"
  end

  create_table "experience_predecessor_drivers", force: :cascade do |t|
    t.integer "experience_predecessor_id"
    t.integer "driving_experience_id"
    t.index ["driving_experience_id"], name: "index_experience_predecessor_drivers_on_driving_experience_id", using: :btree
    t.index ["experience_predecessor_id"], name: "index_experience_predecessor_id", using: :btree
  end

  create_table "experience_predecessors", force: :cascade do |t|
    t.integer "experience_id"
    t.integer "likelihood"
    t.index ["experience_id"], name: "index_experience_predecessors_on_experience_id", using: :btree
  end

  create_table "experience_removals", force: :cascade do |t|
    t.integer  "experience_id"
    t.integer  "removed_experience_id"
    t.integer  "likelihood"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["experience_id"], name: "index_experience_removals_on_experience_id", using: :btree
    t.index ["removed_experience_id"], name: "index_experience_removals_on_removed_experience_id", using: :btree
  end

  create_table "experiences", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.boolean "is_persistent"
    t.integer "num_days"
    t.integer "how_often_change"
    t.integer "parent_id"
    t.integer "min_money"
    t.integer "max_money"
    t.integer "min_health"
    t.integer "max_health"
    t.integer "min_happiness"
    t.integer "max_happiness"
    t.integer "min_got_game"
    t.integer "max_got_game"
    t.integer "money_change"
    t.integer "health_change"
    t.integer "happiness_change"
    t.integer "got_game_change"
    t.integer "location_upgrade_amount"
    t.index ["parent_id"], name: "index_experiences_on_parent_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string  "name"
    t.integer "currency_id"
    t.integer "brexit_factor"
    t.index ["currency_id"], name: "index_locations_on_currency_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string  "name"
    t.boolean "is_admin"
    t.boolean "is_moderator"
    t.boolean "is_creator"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id", using: :btree
    t.index ["user_id"], name: "index_user_roles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "brexit_factor"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "character_base_experiences", "character_bases", column: "character_base_id"
  add_foreign_key "character_base_experiences", "experiences"
  add_foreign_key "character_base_experiences", "locations"
  add_foreign_key "character_base_locations", "characters"
  add_foreign_key "character_base_locations", "locations"
  add_foreign_key "character_experiences", "characters"
  add_foreign_key "character_experiences", "experiences"
  add_foreign_key "characters", "character_bases", column: "character_base_id"
  add_foreign_key "characters", "locations"
  add_foreign_key "characters", "users"
  add_foreign_key "experience_predecessor_drivers", "experience_predecessors"
  add_foreign_key "experience_predecessors", "experiences"
  add_foreign_key "experience_removals", "experiences"
  add_foreign_key "locations", "currencies"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
