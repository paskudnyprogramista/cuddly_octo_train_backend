# frozen_string_literal: true

class Product < ApplicationRecord
  validates :sku, :name, :price, presence: true
  validates :price, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than_or_equal_to: 0 }

  has_many :line_items, -> { order(:position) }, inverse_of: :product, class_name: 'LineItem'
end
