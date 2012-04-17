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

ActiveRecord::Schema.define(:version => 20120417162515) do

  create_table "blog_comments", :force => true do |t|
    t.integer  "blog_post_id",                    :null => false
    t.string   "user_name",                       :null => false
    t.string   "user_email",                      :null => false
    t.text     "content",                         :null => false
    t.boolean  "verified",     :default => false, :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "blog_posts", :force => true do |t|
    t.string   "title",        :null => false
    t.text     "content",      :null => false
    t.string   "slug",         :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.datetime "published_at"
  end

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "pages", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "slug",       :null => false
    t.string   "template",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug", :unique => true

  create_table "projects", :force => true do |t|
    t.string   "name",             :null => false
    t.string   "descriptive_name", :null => false
    t.text     "description",      :null => false
    t.string   "github_url",       :null => false
    t.string   "slug",             :null => false
    t.string   "template",         :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "projects", ["slug"], :name => "index_projects_on_slug", :unique => true

end
