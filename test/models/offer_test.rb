# frozen_string_literal: true

require "test_helper"

class OfferTest < ActiveSupport::TestCase
  # Validations
  test "validates organization presence" do
    offer = FactoryBot.build(:offer)
    offer.organization = nil

    assert_not offer.valid?
    assert offer.errors.of_kind?(:organization, :blank)
  end

  test "validates service presence" do
    offer = FactoryBot.build(:offer)
    offer.service = nil

    assert_not offer.valid?
    assert offer.errors.of_kind?(:service, :blank)
  end

  test "validates price presence" do
    offer = FactoryBot.build(:offer)
    offer.price_cents = nil

    assert_not offer.valid?
    assert offer.errors.of_kind?(:price, :not_a_number)
  end

  test "validates price is greater than or equal to 0" do
    offer = FactoryBot.build(:offer)
    offer.price_cents = -1

    assert_not offer.valid?
    assert offer.errors.of_kind?(:price, :greater_than_or_equal_to)
  end

  test "validates price curreny presence" do
    offer = FactoryBot.build(:offer)
    offer.price_currency = nil

    assert_not offer.valid?
    assert offer.errors.of_kind?(:price_currency, :blank)
  end
end
