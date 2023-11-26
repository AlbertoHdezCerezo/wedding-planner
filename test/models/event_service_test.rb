# frozen_string_literal: true

require "test_helper"

class EventServiceTest < ActiveSupport::TestCase
  # Validations
  test "validates event & service belong to the same wedding" do
    event_service = FactoryBot.build(:event_service)
    event_service.event.wedding_id = SecureRandom.uuid

    assert_not_equal event_service.event.wedding_id, event_service.service.wedding_id
    assert_not event_service.valid?
    assert event_service.errors.of_kind?(:service, :event_wedding_missmatch)
  end
end
