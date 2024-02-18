# frozen_string_literal: true

class Place < ApplicationRecord
  include Decoratable

  # Associations
  has_one :event, dependent: :nullify

  belongs_to :address, dependent: :destroy
  belongs_to :wedding, optional: true

  accepts_nested_attributes_for :address, allow_destroy: true

  # Validations
  validates :name, presence: true
  validates_associated :address
end
