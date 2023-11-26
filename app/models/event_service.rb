# frozen_string_literal: true

class EventService < ApplicationRecord
  # Associations
  belongs_to :event
  belongs_to :service

  validate :event_and_service_belong_to_same_wedding

  private

  def event_and_service_belong_to_same_wedding
    return unless event.wedding_id != service.wedding_id

    errors.add(:service, :event_wedding_missmatch)
  end
end
