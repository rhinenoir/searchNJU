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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coursesmain", id: false, force: :cascade do |t|
    t.string  "id",      limit: 10,                          null: false
    t.string  "name",    limit: 64,                          null: false
    t.decimal "point",               precision: 3, scale: 1
    t.integer "time",                                        null: false
    t.string  "area",    limit: 16,                          null: false
    t.string  "teacher", limit: 148
    t.string  "academy", limit: 64,                          null: false
    t.string  "special", limit: 64,                          null: false
    t.string  "term",    limit: 1,                           null: false
  end

  create_table "coursesmains", id: false, force: :cascade do |t|
    t.string  "id",      limit: 10,                          null: false
    t.string  "name",    limit: 64,                          null: false
    t.decimal "point",               precision: 3, scale: 1
    t.integer "time",                                        null: false
    t.string  "area",    limit: 16,                          null: false
    t.string  "teacher", limit: 148
    t.string  "academy", limit: 64,                          null: false
    t.string  "special", limit: 64,                          null: false
    t.string  "term",    limit: 1,                           null: false
  end

end
