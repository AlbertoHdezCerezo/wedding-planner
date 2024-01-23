# frozen_string_literal: true

require "test_helper"

class AddressDecoratorTest < ActiveSupport::TestCase
  test "#town_address returns address town name, zip code and country" do
    address = Address.new(town: "Paris", zip_code: "75000", country: "France")
    address_decorator = AddressDecorator.new(address)

    assert_equal "Paris, 75000, France", address_decorator.town_address
  end
end
