# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Cart', type: :request do
  describe '#show' do
    context 'when cart is empty' do
      it 'returns empty cart' do
        #  TODO: Impl
      end
    end

    context 'when cart has product' do
      it 'returns cart with product' do
        #  TODO: Impl
      end
    end
  end

  describe '#add_item' do
    context 'when item is not in cart' do
      it 'adds item to cart' do
        #  TODO: Impl
      end
    end

    context 'when item is in cart' do
      it 'adds increase item quantity' do
        #  TODO: Impl
      end
    end
  end

  describe '#remove_item' do
    it 'removes item from cart' do
      #  TODO: Impl
    end
  end
end
