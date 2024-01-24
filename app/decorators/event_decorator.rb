# frozen_string_literal: true

class EventDecorator < ApplicationDecorator
  attr_reader :place_decorator

  def initialize(event)
    @place_decorator = PlaceDecorator.new(event.place) if event.place.present?
    super(event)
  end

  # Event start time in hh:mm format
  def start_time = I18n.l(schedule.begin, format: :short_time)
end
