# frozen_string_literal: true

class Guest < ApplicationRecord
  # Associations
  belongs_to :wedding, optional: false

  # Validations
  validates :name, presence: true
  validates :surname, presence: true
  validates :country, presence: true
end
