# frozen_string_literal: true

require "test_helper"

class WeddingTest < ActiveSupport::TestCase
  # Validations
  test "validates name presence" do
    wedding = FactoryBot.build(:wedding)
    wedding.name = nil

    assert_not wedding.valid?
    assert wedding.errors.of_kind?(:name, :blank)
  end

  test "validates date presence" do
    wedding = FactoryBot.build(:wedding)
    wedding.date = nil

    assert_not wedding.valid?
    assert wedding.errors.of_kind?(:date, :blank)
  end

  test "validates date is in future" do
    wedding = FactoryBot.build(:wedding)
    wedding.date = Date.current - 2.days

    assert_not wedding.valid?
    assert wedding.errors.of_kind?(:date, :greater_than)
  end

  test "if opening event is selected, validates it belongs to Wedding events" do
    wedding = FactoryBot.build(:wedding, :with_events)
    opening_event = FactoryBot.create(:event)

    wedding.opening_event_id = opening_event.id

    assert_not wedding.valid?
    assert wedding.errors.of_kind?(:opening_event_id, :unknown_wedding_event)
  end
end
