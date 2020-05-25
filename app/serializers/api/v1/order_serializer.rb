# frozen_string_literal: true

module Api
  module V1
    class OrderSerializer < BaseSerializer
      attributes :number, :total, :item_total, :adjustment_total, :completed_at

      has_many :line_items
    end
  end
end
