# frozen_string_literal: true

require "test_helper"

class EventDecoratorTest < ActiveSupport::TestCase
  setup do
    @guest = FactoryBot.build(:guest, name: "John", surname: "Doe")
    @guest_decorator = GuestDecorator.new(@guest)
  end

  test "#full_name returns guest name & surname" do
    assert_equal "John Doe", @guest_decorator.full_name
  end
end
