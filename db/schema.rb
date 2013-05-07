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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130505033424) do

  create_table "agencies", :force => true do |t|
    t.string   "shortname"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "groups_trees", :force => true do |t|
    t.integer "group_id"
    t.integer "tree_id"
  end

  create_table "trees", :force => true do |t|
    t.string   "common_name"
    t.string   "genus"
    t.string   "species"
    t.date     "maint_date"
    t.date     "replace_date"
    t.datetime "plant_date"
    t.float    "diameter_at_height"
    t.float    "height"
    t.float    "spread"
    t.boolean  "grove"
    t.integer  "status"
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
    t.spatial  "lonlat",             :limit => {:srid=>4326, :type=>"point"}
    t.integer  "agency_id"
    t.integer  "street_no"
    t.string   "street"
    t.float    "longitude"
    t.float    "latitude"
  end

end
