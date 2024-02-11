# frozen_string_literal: true

require "test_helper"

class GuestTest < ActiveSupport::TestCase
  # Validations
  test "validates name presence" do
    guest = FactoryBot.build(:guest)
    guest.name = nil

    assert_not guest.valid?
    assert guest.errors.of_kind?(:name, :blank)
  end

  test "validates surname presence" do
    guest = FactoryBot.build(:guest)
    guest.surname = nil

    assert_not guest.valid?
    assert guest.errors.of_kind?(:surname, :blank)
  end

  test "validates country presence" do
    guest = FactoryBot.build(:guest)
    guest.country = nil

    assert_not guest.valid?
    assert guest.errors.of_kind?(:country, :blank)
  end

  test "validates language presence" do
    guest = FactoryBot.build(:guest)
    guest.language = nil

    assert_not guest.valid?
    assert guest.errors.of_kind?(:language, :blank)
  end

  # Scopes
  test "#without_invitation returns guests without invitation assigned" do
    guests = FactoryBot.create_list(:guest, 2)
    _invitation = FactoryBot.create(:invitation, guests: [guests.first], wedding: guests.first.wedding)

    result = Guest.without_invitation

    assert_equal [guests.last], result.to_a
  end
end
