# frozen_string_literal: true

require "test_helper"

class EventTest < ActiveSupport::TestCase
  # Validations
  test "validates name presence" do
    event = FactoryBot.build(:event)
    event.name = nil

    assert_not event.valid?
    assert event.errors.of_kind?(:name, :blank)
  end

  test "validates planned is true or false" do
    event = FactoryBot.build(:event)
    event.planned = nil

    assert_not event.valid?
    assert event.errors.of_kind?(:planned, :inclusion)
  end

  test "validates schedule presence" do
    event = FactoryBot.build(:event)
    event.schedule = nil

    assert_not event.valid?
    assert event.errors.of_kind?(:schedule, :blank)
  end

  test "validates start time is greater than end time" do
    timestamp = Time.zone.local(2023, 11, 11, 11, 11)

    event = FactoryBot.build(:event, schedule: timestamp..timestamp.ago(1))

    assert_not event.valid?
    assert event.errors.of_kind?(:end_time, :greater_than)
  end

  test "if associated to service/s, validates services belong to event wedding" do
    service = FactoryBot.create(:service)
    event = FactoryBot.build(:event)

    event.services = [service]

    assert_not event.valid?
    assert event.errors.of_kind?(:event_services, :invalid)
    assert event.event_services.first.errors.of_kind?(:service, :event_wedding_missmatch)
  end
end
