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

ActiveRecord::Schema.define(:version => 6) do

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "postal"
    t.string   "contact"
    t.string   "primary_phone"
    t.string   "secondary_phone"
    t.string   "email_address"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_details", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "qty"
    t.decimal  "weight_lbs", :precision => 5, :scale => 3
    t.decimal  "price",      :precision => 6, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "customer_id"
    t.date     "ship_dt"
    t.integer  "shipper_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.date     "lst_order_dt"
    t.date     "est_reorder_dt"
    t.integer  "vendor_id"
    t.string   "size"
    t.integer  "weight",         :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shippers", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "website"
    t.string   "pickup_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "postal"
    t.string   "contact"
    t.string   "email_address"
    t.string   "timezone"
    t.string   "phone"
    t.string   "tollfree"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
