# frozen_string_literal: true

require "test_helper"

class MenuTest < ActiveSupport::TestCase
  # Validations
  test "validates organization presence" do
    menu = FactoryBot.build(:menu)
    menu.organization = nil

    assert_not menu.valid?
    assert menu.errors.of_kind?(:organization, :blank)
  end

  test "validates name presence" do
    menu = FactoryBot.build(:menu)
    menu.name = nil

    assert_not menu.valid?
    assert menu.errors.of_kind?(:name, :blank)
  end
end
