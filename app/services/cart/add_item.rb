# frozen_string_literal: true

module Cart
  class AddItem < ::BaseService
    class << self
      def call(order:, product:, quantity: nil)
        ApplicationRecord.transaction do
          quantity ||= 1

          line_item = order.line_items.detect do |item|
            item.product_id == product.id
          end

          if line_item.nil?
            line_item = order.line_items.new(quantity: quantity, product: product, price: product.price)
          else
            line_item.quantity += quantity.to_i
          end

          return failure(line_item) unless line_item.save

          line_item.reload

          success(line_item)
        end
      end
    end
  end
end
