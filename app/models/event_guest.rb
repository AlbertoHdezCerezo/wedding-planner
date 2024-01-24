# frozen_string_literal: true

# +Wedding+ +Guests+ invited to a specific +Event+
class EventGuest < ApplicationRecord
  # Associations
  belongs_to :event
  belongs_to :guest

  # Validations
  validates :guest_id, uniqueness: { scope: :event_id }
  validate :guest_invited_to_event_wedding

  private

  def guest_invited_to_event_wedding
    return if event.wedding.in_guests_list?(guest)

    errors.add(:guest, :not_invited_to_wedding)
  end
end
