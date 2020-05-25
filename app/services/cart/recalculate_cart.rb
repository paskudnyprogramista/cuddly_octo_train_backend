# frozen_string_literal: true

module Cart
  class RecalculateCart < ::BaseService
    class << self
      def call(order:)
        order.update_columns(
          total: 0.00,
          item_total: 0.00,
          adjustment_total: 0.00,
          updated_at: Time.current
        )

        success(order)
      end
    end
  end
end
