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

ActiveRecord::Schema.define(:version => 20130511020206) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

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

  create_table "tree_genus", :force => true do |t|
    t.string   "genus"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tree_statuses", :force => true do |t|
    t.string   "status"
    t.integer  "level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tree_types", :force => true do |t|
    t.string   "common_name"
    t.string   "species"
    t.integer  "tree_genus_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "trees", :force => true do |t|
    t.integer  "tree_type_id"
    t.date     "maint_date"
    t.date     "replace_date"
    t.date     "plant_date"
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

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

end
