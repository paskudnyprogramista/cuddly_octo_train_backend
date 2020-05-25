# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :number, limit: 32
      t.decimal :total, precision: 10, scale: 2, default: 0.0, null: false
      t.decimal :item_total, precision: 10, scale: 2, default: 0.0, null: false
      t.decimal :adjustment_total, precision: 10, scale: 2, default: 0.0, null: false
      t.datetime :completed_at
      t.boolean :confirmation_delivered, default: false

      t.timestamps
    end

    add_index :orders, [:number], name: 'index_orders_on_number'
  end
end
