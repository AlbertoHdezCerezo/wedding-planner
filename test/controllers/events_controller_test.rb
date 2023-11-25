# frozen_string_literal: true

require "minitest/autorun"
require "controller_test_helper"

class EventsControllerTest < ControllerTestHelper # rubocop:todo Metrics/ClassLength
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

  test "GET edit renders event form" do
    event = @events.sample

    get edit_wedding_event_path(@wedding, event)

    assert_response :success
  end

  test "GET edit assigns specified event" do
    event = @events.sample

    get edit_wedding_event_path(@wedding, event)

    expected_event = assigns(:event)

    assert_equal expected_event, event
  end

  test "PATCH update if event parameters are valid, redirects to events path" do
    event = @events.sample

    event_payload = { event: { name: "test" } }

    patch wedding_event_path(@wedding, event, **event_payload, format: :turbo_stream)

    assert_response :ok
  end

  test "PATCH update if event parameters are valid, update event" do
    event = @events.sample

    event_payload = { event: { name: "test" } }

    assert_changes -> { event.reload.name }, to: "test" do
      patch wedding_event_path(@wedding, event, **event_payload, format: :turbo_stream)
    end
  end

  test "PATCH create if event parameters are invalid, return unprocessable entity response" do
    event = @events.sample

    event_payload = { event: { name: nil } }

    patch wedding_event_path(@wedding, event, **event_payload, format: :turbo_stream)

    assert_response :unprocessable_entity
  end

  test "PATCH create if event parameters are invalid, event is not updated" do
    event = @events.sample

    event_payload = { event: { name: nil } }

    assert_no_changes -> { event.reload.name } do
      patch wedding_event_path(@wedding, event, **event_payload, format: :turbo_stream)
    end
  end

  test "DELETE destroy if event parameter is valid, returns ok status code" do
    event = @events.sample

    delete wedding_event_path(@wedding, event, format: :turbo_stream)

    assert_response :ok
  end

  test "DELETE destroy if event parameter is valid, removes event" do
    event = @events.sample

    assert_difference -> { @wedding.reload.events.count }, -1 do
      delete wedding_event_path(@wedding, event, format: :turbo_stream)
    end

    assert_not Event.exists?(event.id)
  end

  test "DELETE destroy if event cannot be removed, returns unprocessable entity response" do
    event = @events.sample

    Event.any_instance.stubs(:destroy).returns(false)

    delete wedding_event_path(@wedding, event, format: :turbo_stream)

    assert_response :unprocessable_entity
  end

  test "DELETE destroy if event cannot be removed, does not remove event" do
    event = @events.sample

    Event.any_instance.stubs(:destroy).returns(false)

    assert_no_difference -> { @wedding.reload.events.count } do
      delete wedding_event_path(@wedding, event, format: :turbo_stream)
    end

    assert Event.exists?(event.id)
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
