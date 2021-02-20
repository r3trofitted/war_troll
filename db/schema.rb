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

ActiveRecord::Schema.define(version: 2021_02_20_194122) do

  create_table "actions", force: :cascade do |t|
    t.integer "participation_id", null: false
    t.string "actionable_type", null: false
    t.integer "actionable_id", null: false
    t.integer "activity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actionable_type", "actionable_id"], name: "index_actions_on_actionable"
    t.index ["participation_id"], name: "index_actions_on_participation_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "combatants", force: :cascade do |t|
    t.string "combatable_type", null: false
    t.integer "combatable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["combatable_type", "combatable_id"], name: "index_combatants_on_combatable"
  end

  create_table "combats", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "creatures", force: :cascade do |t|
    t.string "name", null: false
    t.integer "template_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["template_id"], name: "index_creatures_on_template_id"
  end

  create_table "missile_attacks", force: :cascade do |t|
    t.string "phase", default: "A", null: false
    t.string "weapon"
    t.integer "target_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "result"
    t.index ["target_id"], name: "index_missile_attacks_on_target_id"
  end

  create_table "participations", force: :cascade do |t|
    t.integer "round_id", null: false
    t.integer "combatant_id", null: false
    t.integer "base_activity", default: 100, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["combatant_id"], name: "index_participations_on_combatant_id"
    t.index ["round_id", "combatant_id"], name: "index_participations_on_round_id_and_combatant_id", unique: true
    t.index ["round_id"], name: "index_participations_on_round_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "combat_id", null: false
    t.integer "number", default: 1, null: false
    t.integer "phase", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["combat_id", "number"], name: "index_rounds_on_combat_id_and_number", unique: true
    t.index ["combat_id"], name: "index_rounds_on_combat_id"
  end

  create_table "spell_preparations", force: :cascade do |t|
    t.string "spell"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "creatures", "creatures", column: "template_id"
  add_foreign_key "participations", "combatants"
  add_foreign_key "participations", "rounds"
  add_foreign_key "rounds", "combats"
end
