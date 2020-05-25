# frozen_string_literal: true

module Api
  module V1
    class CartController < ApplicationController
      def show
        # TODO: Authorize user

        render_serialized_payload { serialize_order(current_order) }
      end

      def add_item
        # TODO: Authorize user

        result = Cart::AddItem.call(order: current_order, product: product)

        if result.success?
          render_serialized_payload { serialize_order(current_order) }
        else
          render_error_payload(result.error)
        end
      end

      def remove_item
        # TODO: Authorize user

        Cart::RemoveItem.call(order: current_order, line_item: line_item)

        render_serialized_payload { serialize_order(current_order) }
      end

      private

      def current_order
        @current_order ||= find_or_create_current_order
      end

      def find_or_create_current_order
        order = Order.incomplete.order(created_at: :desc).take

        return order unless order.nil?

        Order.create!(number: Order.generate_order_number)
      end

      def line_item
        @line_item ||= current_order.line_items.find(params[:line_item_id])
      end

      def product
        @product ||= Product.find(params[:product_id])
      end

      def resource_serializer
        Api::V1::OrderSerializer
      end

      def resource_includes
        %i[line_items]
      end

      def serialize_order(order)
        serialize_resource(order.reload)
      end
    end
  end
end
