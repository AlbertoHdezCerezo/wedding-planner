# frozen_string_literal: true

require "test_helper"

class EventPlaceTest < ActiveSupport::TestCase
  test "validates uniqueness of event and place in event place" do
    event = FactoryBot.create(:event)
    place = FactoryBot.create(:place)
    event.places << place
    event.save

    assert_raises ActiveRecord::RecordNotUnique do
      EventPlace.create(event:, place:)
    end
  end

  test "validates presence of event" do
    place = FactoryBot.build(:place)
    event_place = EventPlace.new(event: nil, place:)

    assert_not event_place.valid?
    assert event_place.errors.of_kind?(:event, :blank)
  end

  test "validates presence of place" do
    event = FactoryBot.build(:event)
    event_place = EventPlace.new(event:, place: nil)

    assert_not event_place.valid?
    assert event_place.errors.of_kind?(:place, :blank)
  end

  test "if present, validate associated place" do
    event = FactoryBot.build(:event)
    place = FactoryBot.build(:place)
    place.address.street = nil
    event_place = EventPlace.new(event:, place: place)

    assert_not event_place.valid?
    assert event_place.errors.of_kind?(:place, :invalid)
    assert event_place.place.errors.of_kind?(:address, :invalid)
  end
end
