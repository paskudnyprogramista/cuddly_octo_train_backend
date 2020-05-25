# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :order, touch: true, class_name: 'Order', inverse_of: :line_items
  belongs_to :product, class_name: 'Product', inverse_of: :line_items
end
