# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081207153448) do

  create_table "ideas", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "initiator"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ideas_resources", :force => true do |t|
    t.integer "idea_id"
    t.integer "resource_id"
  end

  create_table "ideas_users", :force => true do |t|
    t.integer "idea_id"
    t.integer "user_id"
  end

  create_table "profiles", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "avatar"
    t.string   "additional_infos"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.string   "url"
    t.string   "mime_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "enc_pwd"
    t.string   "salt"
    t.string   "nick"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profile_id"
  end

end
