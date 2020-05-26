# frozen_string_literal: true

module Cart
  class RecalculateCart < ::BaseService
    class << self
      # @param order Order
      def call(order:)
        item_total = order.line_items.sum('price * quantity')
        # TODO: Impl Promotions
        # Promotions will have Rules, which will be used to calculate adjustments
        adjustment_total = 0.00
        total = item_total + adjustment_total

        order.update_columns(
          total: total,
          item_total: item_total,
          adjustment_total: adjustment_total,
          updated_at: Time.current
        )

        success(order)
      end
    end
  end
end
