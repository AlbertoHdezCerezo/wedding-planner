# frozen_string_literal: true

class PlaceDecorator < ApplicationDecorator
  attr_reader :address_decorator

  def initialize(place)
    @address_decorator = AddressDecorator.new(place.address) if place.address.present?
    super(place)
  end
end
