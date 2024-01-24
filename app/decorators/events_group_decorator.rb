# frozen_string_literal: true

class EventsGroupDecorator < ApplicationDecorator
  attr_reader :event_decorators, :place_decorator

  def initialize(event_group)
    @place_decorator = PlaceDecorator.new(event_group.place) if event_group.place.present?
    @event_decorators = event_group.events.map { EventDecorator.new(_1) }
    super(event_group)
  end
end
