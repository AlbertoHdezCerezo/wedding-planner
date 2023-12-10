# frozen_string_literal: true

require "test_helper"

class DishTest < ActiveSupport::TestCase
  # Validations
  test "validates organization presence" do
    dish = FactoryBot.build(:dish)
    dish.organization = nil

    assert_not dish.valid?
    assert dish.errors.of_kind?(:organization, :blank)
  end

  test "validates price presence" do
    dish = FactoryBot.build(:dish)
    dish.price_cents = nil

    assert_not dish.valid?
    assert dish.errors.of_kind?(:price, :not_a_number)
  end

  test "validates price is greater than or equal to 0" do
    dish = FactoryBot.build(:dish)
    dish.price_cents = -1

    assert_not dish.valid?
    assert dish.errors.of_kind?(:price, :greater_than_or_equal_to)
  end

  test "validates price currency presence" do
    dish = FactoryBot.build(:dish)
    dish.price_currency = nil

    assert_not dish.valid?
    assert dish.errors.of_kind?(:price_currency, :blank)
  end

  test "validates dietary restrictions inclusion" do
    dish = FactoryBot.build(:dish)
    dish.dietary_restrictions = %w[invalid]

    assert_not dish.valid?
    assert dish.errors.of_kind?(:dietary_restrictions, :inclusion)
  end
end
