# frozen_string_literal: true

module Cart
  class RemoveItem < ::BaseService
    class << self
      def call(order:, line_item:)
        ApplicationRecord.transaction do
          line_item.destroy!

          # recalculate
        end

        success(line_item)
      end
    end
  end
end
