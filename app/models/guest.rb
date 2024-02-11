# frozen_string_literal: true

class Guest < ApplicationRecord
  # Supported languages
  enum language: { en: "en", es: "es" }

  # Associations
  belongs_to :wedding, optional: false
  belongs_to :invitation, optional: true
  has_many :event_guests, dependent: :destroy
  has_many :events, through: :event_guests

  # Validations
  validates :name, presence: true
  validates :surname, presence: true
  validates :country, presence: true
  validates :language, presence: true

  # Scopes
  scope :without_invitation, -> { where(invitation_id: nil) }
end
