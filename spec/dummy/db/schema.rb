# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131013152405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "all_aboard_boards", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "all_aboard_configurable_attribute_values", force: true do |t|
    t.string   "configurable_attribute_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "all_aboard_perspective_assignments", force: true do |t|
    t.string   "template_id"
    t.integer  "column"
    t.integer  "row"
    t.integer  "slide_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "all_aboard_perspective_assignments", ["slide_id"], name: "index_all_aboard_perspective_assignments_on_slide_id", using: :btree

  create_table "all_aboard_slides", force: true do |t|
    t.integer  "board_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "all_aboard_slides", ["board_id"], name: "index_all_aboard_slides_on_board_id", using: :btree

end
