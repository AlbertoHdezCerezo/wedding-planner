# frozen_string_literal: true

class Wedding < ApplicationRecord
  # Associations
  has_many :events, dependent: :destroy
  has_many :guests, dependent: :destroy
  has_many :services, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :date, presence: true, comparison: { greater_than: Date.current }
end
