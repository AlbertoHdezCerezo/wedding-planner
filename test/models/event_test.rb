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

  test "validates start_time presence" do
    event = FactoryBot.build(:event)
    event.start_time = nil

    assert_not event.valid?
    assert event.errors.of_kind?(:start_time, :blank)
  end

  test "validates end_time presence" do
    event = FactoryBot.build(:event)
    event.end_time = nil

    assert_not event.valid?
    assert event.errors.of_kind?(:end_time, :blank)
  end

  test "validates kind presence" do
    event = FactoryBot.build(:event)
    event.kind = nil

    assert_not event.valid?
    assert event.errors.of_kind?(:kind, :blank)
  end

  test "validates start time is greater than end time" do
    timestamp = Time.zone.local(2023, 11, 11, 11, 11)

    event = FactoryBot.build(:event, start_time: timestamp, end_time: timestamp.ago(1),
                                     schedule: timestamp..timestamp.ago(1))

    assert_not event.valid?
    assert event.errors.of_kind?(:end_time, :greater_than)
  end

  test "validates kind is a valid one" do
    event = FactoryBot.build(:event)
    assert_raise ArgumentError do
      event.kind = "invalid kind"
    end
  end

  test "if associated to service/s, validates services belong to event wedding" do
    service = FactoryBot.create(:service)
    event = FactoryBot.build(:event)
    service.name = nil

    event.services = [service]

    assert_not event.valid?
    assert event.errors.of_kind?(:services, :invalid)
    assert event.services.first.errors.of_kind?(:name, :blank)
  end

  test "if associated to place, validates places belong to event wedding" do
    place = FactoryBot.create(:place)
    event = FactoryBot.build(:event)
    place.address.street = nil

    event.place = place

    assert_not event.valid?
    assert event.errors.of_kind?(:place, :invalid)
    assert event.place.errors.of_kind?(:address, :invalid)
  end
end
