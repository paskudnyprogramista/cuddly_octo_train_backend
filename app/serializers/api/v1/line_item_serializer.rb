# frozen_string_literal: true

module Api
  module V1
    class LineItemSerializer < BaseSerializer
      attributes :quantity, :price

      attribute :product_name do |resource|
        resource.product.name
      end

      attribute :product_id do |resource|
        resource.product.id
      end

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
