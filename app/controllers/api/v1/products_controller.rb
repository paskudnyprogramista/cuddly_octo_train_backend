# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApplicationController
      def index
        render json: { products: :index }
      end

      private

      def resource
        Product.find(params[:id])
      end

      def collection
        Product.all
      end

      def resource_serializer
        Api::V1::ProducSerializer
      end
    end
  end
end
