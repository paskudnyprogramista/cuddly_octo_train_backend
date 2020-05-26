# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_many(:line_items) }

  it { should accept_nested_attributes_for(:line_items) }
end
