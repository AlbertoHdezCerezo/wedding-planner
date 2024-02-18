# frozen_string_literal: true

class Wedding < ApplicationRecord
  # Associations
  has_one :opening_event, required: false, class_name: "Event", dependent: :nullify

  has_many :events, dependent: :destroy
  has_many :guests, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :places, dependent: :nullify

  # Validations
  validates :name, presence: true
  validates :date, presence: true, comparison: { greater_than: Date.current }
  validate :opening_event_in_events, if: -> { opening_event_id.present? }

  def in_guests_list?(guest) = guests.include?(guest)

  def days_left = (date - Date.current).to_i

  private

  def opening_event_in_events
    errors.add(:opening_event_id, :unknown_wedding_event) unless events.exists?(opening_event_id)
  end
end
