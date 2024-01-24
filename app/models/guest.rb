# frozen_string_literal: true

class Guest < ApplicationRecord
  # Associations
  belongs_to :wedding, optional: false
  has_many :event_guests, dependent: :destroy
  has_many :events, through: :event_guests

  # Validations
  validates :name, presence: true
  validates :surname, presence: true
  validates :country, presence: true
end
