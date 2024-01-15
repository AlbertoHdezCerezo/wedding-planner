# frozen_string_literal: true

require "test_helper"

class PlaceTest < ActiveSupport::TestCase
  # Validations
  test "validates name presence" do
    place = FactoryBot.build(:place)
    place.name = nil

    assert_not place.valid?
    assert place.errors.of_kind?(:name, :blank)
  end
end
