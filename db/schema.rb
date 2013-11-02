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

ActiveRecord::Schema.define(:version => 20131102052410) do

  create_table "article_lines", :force => true do |t|
    t.integer  "article_id"
    t.integer  "line_number"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.text     "text"
    t.integer  "reviews_count", :default => 0, :null => false
  end

  add_index "article_lines", ["article_id", "line_number"], :name => "index_article_lines_on_article_id_and_line_number"

  create_table "article_reviews", :force => true do |t|
    t.integer  "reviewable_id"
    t.string   "reviewable_type", :limit => 64
    t.text     "text"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "user_id",                       :null => false
  end

  add_index "article_reviews", ["reviewable_id", "reviewable_type"], :name => "index_article_reviews_on_reviewable_id_and_reviewable_type"

  create_table "articles", :force => true do |t|
    t.string   "title",                             :null => false
    t.string   "reporter_name"
    t.text     "content",                           :null => false
    t.datetime "published_at"
    t.string   "url",                               :null => false
    t.string   "company_name"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "web_domain"
    t.string   "url_id"
    t.integer  "line_reviews_count", :default => 0, :null => false
  end

  add_index "articles", ["web_domain", "url_id"], :name => "index_articles_on_web_domain_and_url_id", :unique => true

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "guest",                  :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
