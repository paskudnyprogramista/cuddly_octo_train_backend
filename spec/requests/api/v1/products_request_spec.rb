# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Products', type: :request do
  describe '.index' do
    let!(:products) { create_list(:product, 3) }

    before { get '/api/v1/products' }

    it 'returns serialized product data' do
      json_response = ActiveSupport::JSON.decode(response.body)

      expect(json_response['data'].count).to eq(3)
      expect(response.status).to eq(200)
      expect(response.content_type).to eq('application/vnd.api+json; charset=utf-8')
    end
  end

  describe '.show' do
    let!(:product) { create(:product) }

    let(:expected_json_response) do
      {
        'id' => product.id.to_s,
        'type' => 'product',
        'attributes' => {
          'id' => product.id.to_s,
          'sku' => product.sku,
          'name' => product.name,
          'price' => product.price.to_s
        }
      }
    end

    before { get "/api/v1/products/#{product.id}" }

    it 'returns serialized product data' do
      json_response = ActiveSupport::JSON.decode(response.body)

      expect(json_response['data']).to include_json(expected_json_response)
      expect(response.status).to eq(200)
      expect(response.content_type).to eq('application/vnd.api+json; charset=utf-8')
    end
  end
end
