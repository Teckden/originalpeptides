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

ActiveRecord::Schema.define(:version => 20130814102736) do

  create_table "admin_users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "admin_users", ["username"], :name => "index_admin_users_on_username"

  create_table "assets", :force => true do |t|
    t.integer  "product_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "assets", ["product_id"], :name => "index_assets_on_product_id"

  create_table "cart_products", :force => true do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "quantity",                                 :default => 1
    t.decimal  "price",      :precision => 8, :scale => 2
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.integer  "order_id"
  end

  add_index "cart_products", ["cart_id", "product_id"], :name => "index_cart_products_on_cart_id_and_product_id"

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "default_meta_tags", :force => true do |t|
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.string   "title"
    t.string   "method"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.string   "details"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "page"
    t.string   "custom_url"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "meta_description"
    t.string   "meta_keywords"
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price",            :precision => 8, :scale => 2
    t.boolean  "available",                                      :default => false
    t.string   "producer"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
    t.string   "custom_url"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.decimal  "russian_price",    :precision => 8, :scale => 2
  end

end
