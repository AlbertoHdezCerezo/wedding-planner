# frozen_string_literal: true

require "test_helper"

class EventDecoratorTest < ActiveSupport::TestCase
  setup do
    time_range = Time.zone.local(2021, 1, 1, 12, 0, 0)..Time.zone.local(2021, 1, 1, 13, 0, 0)
    event = FactoryBot.build(:event, schedule: time_range)
    @event_decorator = EventDecorator.new(event)
  end

  test "#start_time returns event start time in hh:mm format" do
    assert_equal "12:00", @event_decorator.start_time
  end
end
