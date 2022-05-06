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

ActiveRecord::Schema[7.0].define(version: 2022_05_06_064702) do
  create_table "brands", force: :cascade do |t|
    t.string "brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reel_types", force: :cascade do |t|
    t.string "reel_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reels", force: :cascade do |t|
    t.string "item_name"
    t.integer "size"
    t.string "description"
    t.integer "price"
    t.string "item_condition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reel_type_id", null: false
    t.integer "brand_id", null: false
    t.index ["brand_id"], name: "index_reels_on_brand_id"
    t.index ["reel_type_id"], name: "index_reels_on_reel_type_id"
  end

  add_foreign_key "reels", "brands"
  add_foreign_key "reels", "reel_types"
end
