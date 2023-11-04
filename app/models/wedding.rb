# frozen_string_literal: true

class Wedding < ApplicationRecord
  # Associations
  has_many :guests, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :date, presence: true, comparison: { greater_than: Date.current }
end
