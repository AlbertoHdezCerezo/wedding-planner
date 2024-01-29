# frozen_string_literal: true

class Place < ApplicationRecord
  include Decoratable

  # Associations
  belongs_to :address, dependent: :destroy

  accepts_nested_attributes_for :address, allow_destroy: true

  # Validations
  validates :name, presence: true
  validates_associated :address
end
