# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    sku { Faker::Lorem.characters(number: 7) }
    name { Faker::Commerce.product_name }
    price { Faker::Number.decimal }
  end
end
