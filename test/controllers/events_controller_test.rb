# frozen_string_literal: true

require "controller_test_helper"

class EventsControllerTest < ControllerTestHelper
  setup do
    @wedding = FactoryBot.create(:wedding)
    @events = FactoryBot.create_list(:event, 3, wedding: @wedding)
  end

  test "GET new renders event form" do
    get new_wedding_event_path(@wedding)

    assert_response :success
  end

  test "GET new assigns new event" do
    get new_wedding_event_path(@wedding)

    event = assigns(:event)

    assert_predicate event, :new_record?
  end

  test "POST create if event parameters are valid, renders event template" do
    post wedding_events_path(@wedding, **valid_event_payload, format: :turbo_stream)

    assert_response :created
  end

  test "POST create if event parameters are valid, creates new wedding event" do
    assert_difference -> { @wedding.events.reload.count }, 1 do
      post wedding_events_path(@wedding, **valid_event_payload, format: :turbo_stream)
    end
  end

  test "POST create if event parameters are invalid, return unprocessable entity response" do
    post wedding_events_path(@wedding, **invalid_event_payload, format: :turbo_stream)

    assert_response :unprocessable_entity
  end

  test "POST create if event parameters are invalid, no event is created" do
    assert_no_difference -> { @wedding.events.reload.count } do
      post wedding_events_path(@wedding, **invalid_event_payload, format: :turbo_stream)
    end
  end

  private

  def valid_event_payload
    attributes = FactoryBot.attributes_for(:event)
    attributes[:start_time] = attributes[:schedule].begin
    attributes[:end_time] = attributes[:schedule].end
    attributes.except!(:planned, :schedule)

    { event: attributes }
  end

  def invalid_event_payload
    { event: { invalid_parameter: true } }
  end
end
