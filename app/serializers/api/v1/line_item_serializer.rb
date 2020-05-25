# frozen_string_literal: true

module Api
  module V1
    class LineItemSerializer < BaseSerializer
      attributes :quantity, :price

      belongs_to :order, links: {
        self: lambda { |resource|
          url_helpers.api_v1_order_url(resource.order_id)
        }
      }

      belongs_to :product, links: {
        self: lambda { |resource|
          url_helpers.api_v1_product_url(resource.product_id)
        }
      }
    end
  end
end
