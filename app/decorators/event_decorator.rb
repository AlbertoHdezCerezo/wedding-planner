# frozen_string_literal: true

class EventDecorator < ApplicationDecorator
  attr_reader :place_decorator

  def initialize(event)
    @place_decorator = PlaceDecorator.new(event.place) if event.place.present?
    super(event)
  end
end
