# frozen_string_literal: true

class AddressDecorator < ApplicationDecorator
  def town_address = "#{town}, #{zip_code}, #{country}"
end
