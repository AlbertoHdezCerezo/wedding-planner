# frozen_string_literal: true

require "test_helper"

class EventsGroupDecoratorTest < ActiveSupport::TestCase
  setup do
    time_range = Time.zone.local(2021, 1, 1, 12, 0, 0)..Time.zone.local(2021, 1, 1, 13, 0, 0)

    wedding = FactoryBot.build(
      :wedding,
      guests: FactoryBot.build_list(:guest, 2),
      events: [
        FactoryBot.build(
          :event,
          schedule: time_range,
          place: FactoryBot.build(
            :place,
            name: "Place name",
            address: FactoryBot.build(
              :address,
              street: "Street name",
              town: "Town name",
              zip_code: "Zip code",
              country: "Country name"
            )
          )
        )
      ]
    )

    @event_group_decorator = EventsGroupDecorator.new(
      Schedule.new(wedding:, guest: wedding.guests.first).event_groups.first
    )
  end

  test "#abbreviated_start_month returns starting event start month" do
    assert_equal "Jan", @event_group_decorator.abbreviated_start_month
  end

  test "#full_address returns event group place complete address" do
    assert_equal "Street name, Town name, Zip code, Country name", @event_group_decorator.full_address
  end

  test "#place_name returns event group place name" do
    assert_equal "Place name", @event_group_decorator.place_name
  end

  test "#start_day returns starting event start day" do
    assert_equal 1, @event_group_decorator.start_day
  end
end
