# frozen_string_literal: true

module Api
  module V1
    class ProductSerializer < BaseSerializer
      attributes :sku, :name, :price
    end
  end
end
