# frozen_string_literal: true

require "test_helper"

class EventGuestTest < ActiveSupport::TestCase
  # Validations
  test "validates guest is present in wedding's guest list" do
    guest = FactoryBot.create(:guest)
    wedding = FactoryBot.create(:wedding, guests: [guest])
    event = FactoryBot.create(:event, wedding:)
    _first_event_guest = EventGuest.create(event:, guest:)
    second_event_guest = EventGuest.new(event:, guest:)

    assert_not second_event_guest.valid?
    assert second_event_guest.errors.of_kind?(:guest_id, :taken)
  end

  test "validates guest is not already invited to event" do
    guest = FactoryBot.create(:guest)
    event = FactoryBot.create(:event)
    event_guest = EventGuest.new(event:, guest:)

    assert_not event_guest.valid?
    assert event_guest.errors.of_kind?(:guest, :not_invited_to_wedding)
  end
end
