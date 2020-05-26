# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :order, touch: true, class_name: 'Order', inverse_of: :line_items
  belongs_to :product, class_name: 'Product', inverse_of: :line_items

  validates :price, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than_or_equal_to: 0 }

  before_validation :copy_price

  private

  def copy_price
    self.price = product.price
  end
end
