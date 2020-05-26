# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :line_items, -> { order(:created_at) }, class_name: 'LineItem', inverse_of: :order

  scope :incomplete, -> { where(completed_at: nil) }

  accepts_nested_attributes_for :line_items

  def completed?
    completed_at.present?
  end

  def finalize!
    touch :completed_at

    send_order_confirmation_email unless confirmation_delivered?
  end

  def send_order_confirmation_email
    # TODO: Impl OrderMailer service

    update_column(:confirmation_delivered, true)
  end

  class << self
    def generate_order_number
      # Base36 coding
      SecureRandom.random_number(36**7).to_s(36).upcase
    end
  end
end
