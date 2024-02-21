# frozen_string_literal: true

class Event < ApplicationRecord
  include Decoratable

  # Enums
  enum kind: {
    ceremony: "ceremony",
    cocktail: "cocktail",
    dinner: "dinner",
    party: "party",
    dance: "dance",
    other: "other"
  }

  # Associations
  belongs_to :wedding
  belongs_to :place, optional: true
  has_many :event_services, dependent: :destroy
  has_many :services, through: :event_services
  has_many :event_guests, dependent: :destroy
  has_many :guests, through: :event_guests

  accepts_nested_attributes_for :place, allow_destroy: true

  # Validations
  validates :name, presence: true
  validates :planned, inclusion: { in: [true, false] }
  validates :start_time, :end_time, :kind, presence: true

  validates_comparison_of :end_time, greater_than: :start_time

  validates_associated :services
  validates_associated :place

  # Scopes
  scope :chronological, -> { order(schedule: :asc) }

  def schedule = start_time..end_time
end
