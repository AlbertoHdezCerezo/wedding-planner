# frozen_string_literal: true

class Offer < ApplicationRecord
  # Associations
  belongs_to :organization
  belongs_to :service

  # Validations
  validates :price_currency, presence: true
  monetize :price_cents,
           allow_nil: false,
           numericality: { greater_than_or_equal_to: 0 }
end
