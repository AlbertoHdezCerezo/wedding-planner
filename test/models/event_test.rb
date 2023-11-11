# frozen_string_literal: true

require "test_helper"

class EventTest < ActiveSupport::TestCase
  # Validations
  test "validates name presence" do
    event = FactoryBot.build(:event)
    event.name = nil

    assert_not event.valid?
    assert event.errors.of_kind?(:name, :blank)
  end

  test "validates planned is true or false" do
    event = FactoryBot.build(:event)
    event.planned = nil

    assert_not event.valid?
    assert event.errors.of_kind?(:planned, :inclusion)
  end

  test "validates schedule presence" do
    event = FactoryBot.build(:event)
    event.schedule = nil

    assert_not event.valid?
    assert event.errors.of_kind?(:schedule, :blank)
  end
end
