# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to validate_presence_of(:sku) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:price) }

  it { is_expected.to validate_numericality_of(:price) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  it { should allow_value(1.01).for(:price) }
  it { should allow_value(1.034).for(:price) }
  it { should_not allow_value(1.0).for(:price) }
end
