# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApplicationController
      def index
        render_serialized_payload { serialize_collection(collection) }
      end

      def show
        render_serialized_payload { serialize_resource(resource) }
      end

      private

      def resource
        Product.find(params[:id])
      end

      def collection
        Product.all
      end

      def resource_serializer
        Api::V1::ProductSerializer
      end
    end
  end
end
