# frozen_string_literal: true

class EventsGroupDecorator < ApplicationDecorator
  attr_reader :event_decorators, :place_decorator

  def initialize(event_group)
    @place_decorator = PlaceDecorator.new(event_group.place) if event_group.place.present?
    @event_decorators = event_group.events.map { EventDecorator.new(_1) }
    super(event_group)
  end

  # Event group starting event starting month in abbreviated format
  # e.g. "Jan" for January
  def abbreviated_start_month
    I18n.l(time_range.begin.to_date, format: :abbreviated_month)
  end

  def full_address = place_decorator&.address_decorator&.full_address

  def place_name = place_decorator&.name

  # Event group starting event starting day
  # e.g. "1" for 1st of January
  def start_day = time_range.begin.day
end
