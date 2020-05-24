# frozen_string_literal: true

module Api
  module V1
    class ProductSerializer
      include FastJsonapi::ObjectSerializer

      attributes :sku, :name, :price
    end
  end
end
