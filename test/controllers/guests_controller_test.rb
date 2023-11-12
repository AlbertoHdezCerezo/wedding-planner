# frozen_string_literal: true

require "controller_test_helper"

class GuestsControllerTest < ControllerTestHelper
  setup do
    @wedding = FactoryBot.create(:wedding)
    @guests = FactoryBot.create_list(:guest, 3, wedding: @wedding)
  end

  test "GET index renders guest page" do
    get wedding_guests_path(@wedding)

    assert_response :success
  end

  test "GET index fetches wedding" do
    get wedding_guests_path(@wedding)

    wedding = assigns(:wedding)

    assert_equal wedding, @wedding
  end

  test "GET index fetches wedding guests" do
    get wedding_guests_path(@wedding)

    guests = assigns(:guests)

    assert_equal guests.sort, @guests.sort
  end

  test "GET new renders guest form" do
    get new_wedding_guest_path(@wedding)

    assert_response :success
  end

  test "GET new assigns new wedding" do
    get new_wedding_guest_path(@wedding)

    guest = assigns(:guest)

    assert_predicate guest, :new_record?
  end

  test "GET edit renders guest form" do
    guest = @guests.sample

    get edit_wedding_guest_path(@wedding, guest)

    assert_response :success
  end

  test "GET edit assigns specified guest" do
    guest = @guests.sample

    get edit_wedding_guest_path(@wedding, guest)

    response_guest = assigns(:guest)

    assert_equal response_guest, guest
  end

  test "POST create if guest parameters are valid, redirects to guests path" do
    guest_payload = { guest: FactoryBot.attributes_for(:guest) }

    post wedding_guests_path(@wedding, **guest_payload, format: :turbo_stream)

    assert_response :created
  end

  test "POST create if guest parameters are valid, creates new wedding guest" do
    guest_payload = { guest: FactoryBot.attributes_for(:guest) }

    assert_difference -> { @wedding.guests.reload.count }, 1 do
      post wedding_guests_path(@wedding, **guest_payload, format: :turbo_stream)
    end
  end

  test "POST create if guest parameters are invalid, return unprocessable entity response" do
    guest_payload = { guest: { invalid_parameter: true } }

    post wedding_guests_path(@wedding, **guest_payload, format: :turbo_stream)

    assert_response :unprocessable_entity
  end

  test "POST create if guest parameters are invalid, no guest is created" do
    guest_payload = { guest: { invalid_parameter: true } }

    assert_no_difference -> { @wedding.guests.reload.count } do
      post wedding_guests_path(@wedding, **guest_payload, format: :turbo_stream)
    end
  end

  test "PATCH update if guest parameters are valid, redirects to guests path" do
    guest = @guests.sample

    guest_payload = { guest: { name: "test" } }

    patch wedding_guest_path(@wedding, guest, **guest_payload, format: :turbo_stream)

    assert_response :ok
  end

  test "PATCH update if guest parameters are valid, update guest" do
    guest = @guests.sample

    guest_payload = { guest: { name: "test" } }

    assert_changes -> { guest.reload.name }, to: "test" do
      patch wedding_guest_path(@wedding, guest, **guest_payload, format: :turbo_stream)
    end
  end

  test "PATCH create if guest parameters are invalid, return unprocessable entity response" do
    guest = @guests.sample

    guest_payload = { guest: { name: nil } }

    patch wedding_guest_path(@wedding, guest, **guest_payload, format: :turbo_stream)

    assert_response :unprocessable_entity
  end

  test "PATCH create if guest parameters are invalid, guest is not updated" do
    guest = @guests.sample

    guest_payload = { guest: { name: nil } }

    assert_no_changes -> { guest.reload.name } do
      patch wedding_guest_path(@wedding, guest, **guest_payload, format: :turbo_stream)
    end
  end
end
