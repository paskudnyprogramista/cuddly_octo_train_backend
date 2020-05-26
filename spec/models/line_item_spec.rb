# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LineItem, type: :model do
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }

  it { should belong_to(:order) }
  it { should belong_to(:product) }

  it { should allow_value(1.01).for(:price) }
  it { should allow_value(1.034).for(:price) }
  it { should_not allow_value(1.0).for(:price) }
end
