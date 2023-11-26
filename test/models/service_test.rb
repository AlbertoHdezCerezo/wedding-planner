# frozen_string_literal: true

require "test_helper"

class ServiceTest < ActiveSupport::TestCase
  # Validations
  test "validates name presence" do
    service = FactoryBot.build(:service)
    service.name = nil

    assert_not service.valid?
    assert service.errors.of_kind?(:name, :blank)
  end

  test "if associated to event/s, validates events belong to service wedding" do
    event = FactoryBot.create(:event)
    service = FactoryBot.build(:service)

    service.events = [event]

    assert_not service.valid?
    assert service.errors.of_kind?(:event_services, :invalid)
    assert service.event_services.first.errors.of_kind?(:service, :event_wedding_missmatch)
  end
end
