# frozen_string_literal: true

class ScheduleDecorator < ApplicationDecorator
  attr_reader :event_group_decorators

  def initialize(event)
    @event_group_decorators = event.event_groups.map { EventsGroupDecorator.new(_1) }
    super(event)
  end
end
