# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_525_144_120) do
  create_table 'line_items', force: :cascade do |t|
    t.integer 'order_id'
    t.integer 'product_id'
    t.integer 'quantity', null: false
    t.decimal 'price', precision: 8, scale: 2, null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['order_id'], name: 'index_line_items_on_order_id'
    t.index ['product_id'], name: 'index_line_items_on_product_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.string 'number', limit: 32
    t.decimal 'total', precision: 10, scale: 2, default: '0.0', null: false
    t.decimal 'item_total', precision: 10, scale: 2, default: '0.0', null: false
    t.decimal 'adjustment_total', precision: 10, scale: 2, default: '0.0', null: false
    t.datetime 'completed_at'
    t.boolean 'confirmation_delivered', default: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'products', force: :cascade do |t|
    t.string 'sku'
    t.string 'name'
    t.decimal 'price', precision: 8, scale: 2, null: false
  end
end
