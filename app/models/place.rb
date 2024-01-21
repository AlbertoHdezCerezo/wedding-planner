# frozen_string_literal: true

class Place < ApplicationRecord
  # Associations
  belongs_to :address, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates_associated :address
end
