# frozen_string_literal: true

require "test_helper"

class EventPlaceTest < ActiveSupport::TestCase
  test "validates uniqueness of event and place in event place" do
    event = FactoryBot.create(:event)
    place = FactoryBot.create(:place)
    event.places << place
    event.save

    assert_raises ActiveRecord::RecordNotUnique do
      EventPlace.create(event:, place:)
    end
  end
end
