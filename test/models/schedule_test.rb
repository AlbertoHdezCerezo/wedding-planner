# frozen_string_literal: true

require "test_helper"

class ScheduleTest < ActiveSupport::TestCase
  test "if guest not present in wedding list, schedule raises ArgumentError during initialization" do
    wedding = FactoryBot.build(:wedding)
    guest = FactoryBot.build(:guest)

    assert_raises(ArgumentError) { Schedule.new(wedding:, guest:) }
  end

  test "#event_groups returns wedding events grouped by place, sorted chronologically" do
    wedding = FactoryBot.build(:wedding)
    places = FactoryBot.build_list(:place, 2)
    guest = FactoryBot.build(:guest, wedding:)
    timestamp = Time.zone.local(2023, 11, 11, 11, 11)
    wedding.events = [
      FactoryBot.build(:event, place: places.first, schedule: timestamp..timestamp.since(1)),
      FactoryBot.build(:event, place: places.first, schedule: timestamp.since(1)..timestamp.since(2)),
      FactoryBot.build(:event, place: places.first, schedule: timestamp.since(3)..timestamp.since(4)),
      FactoryBot.build(:event, place: places.last, schedule: timestamp.since(4)..timestamp.since(5)),
      FactoryBot.build(:event, place: places.last, schedule: timestamp.since(5)..timestamp.since(6))
    ]
    wedding.guests = [guest]

    schedule = Schedule.new(wedding:, guest:)

    assert_equal 2, schedule.event_groups.size

    expected_first_group_events = wedding.events.select { |event| event.place == places.first }
    expected_last_group_events = wedding.events.select { |event| event.place == places.last }

    assert_equal expected_first_group_events, schedule.event_groups.first.events
    assert_equal expected_last_group_events, schedule.event_groups.last.events
  end
end
