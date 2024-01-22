# frozen_string_literal: true

require "test_helper"

class AddressTest < ActiveSupport::TestCase
  setup do
    @address = FactoryBot.build(:address)
  end

  # Validations
  test "validates country presence" do
    @address.country = nil

    assert_not @address.valid?
  end

  test "validates street presence" do
    @address.street = nil

    assert_not @address.valid?
  end

  test "validates town presence" do
    @address.town = nil

    assert_not @address.valid?
  end

  test "validates zip_code presence" do
    @address.zip_code = nil

    assert_not @address.valid?
  end
end
