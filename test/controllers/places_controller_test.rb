# frozen_string_literal: true

require "minitest/autorun"
require "controller_test_helper"

class PlacesControllerTest < ControllerTestHelper # rubocop:todo Metrics/ClassLength
  setup do
    @wedding = FactoryBot.create(:wedding)
    @places = FactoryBot.create_list(:place, 3, wedding: @wedding)
  end

  test "GET index renders place page" do
    get wedding_places_path(@wedding)

    assert_response :success
  end

  test "GET index fetches wedding" do
    get wedding_places_path(@wedding)

    wedding = assigns(:wedding)

    assert_equal wedding, @wedding
  end

  test "GET index fetches wedding places" do
    get wedding_places_path(@wedding)

    places = assigns(:places)

    assert_equal places.sort, @places.sort
  end

  test "GET new renders place form" do
    get new_wedding_place_path(@wedding)

    assert_response :success
  end

  test "GET new assigns new place" do
    get new_wedding_place_path(@wedding)

    place = assigns(:place)

    assert_predicate place, :new_record?
  end

  test "POST create if place parameters are valid, renders event template" do
    place_payload = { place: FactoryBot.attributes_for(:place)
                                       .merge({ address_attributes: FactoryBot.attributes_for(:address) }) }

    post wedding_places_path(@wedding, **place_payload, format: :turbo_stream)

    assert_response :created
  end

  test "POST create if place parameters are valid, creates new wedding place" do
    place_payload = { place: FactoryBot.attributes_for(:place)
                                       .merge({ address_attributes: FactoryBot.attributes_for(:address) }) }

    assert_difference -> { @wedding.places.reload.count }, 1 do
      post wedding_places_path(@wedding, **place_payload, format: :turbo_stream)
    end
  end

  test "POST create if place parameters are invalid, return unprocessable entity response" do
    place_payload = { place: { invalid_parameter: true } }

    post wedding_places_path(@wedding, **place_payload, format: :turbo_stream)

    assert_response :unprocessable_entity
  end

  test "POST create if place parameters are invalid, no place is created" do
    place_payload = { place: { invalid_parameter: true } }

    assert_no_difference -> { @wedding.places.reload.count } do
      post wedding_places_path(@wedding, **place_payload, format: :turbo_stream)
    end
  end

  test "GET edit renders place form" do
    place = @places.sample

    get edit_wedding_place_path(@wedding, place)

    assert_response :success
  end

  test "GET edit assigns specified place" do
    place = @places.sample

    get edit_wedding_place_path(@wedding, place)

    response_place = assigns(:place)

    assert_equal response_place, place
  end

  test "PATCH update if place parameters are valid, redirects to places path" do
    place = @places.sample

    place_payload = { place: { name: "test" } }

    patch wedding_place_path(@wedding, place, **place_payload, format: :turbo_stream)

    assert_response :ok
  end

  test "PATCH update if place parameters are valid, update place" do
    place = @places.sample

    place_payload = { place: { name: "test" } }

    assert_changes -> { place.reload.name }, to: "test" do
      patch wedding_place_path(@wedding, place, **place_payload, format: :turbo_stream)
    end
  end

  test "PATCH create if place parameters are invalid, return unprocessable entity response" do
    place = @places.sample

    place_payload = { place: { name: nil } }

    patch wedding_place_path(@wedding, place, **place_payload, format: :turbo_stream)

    assert_response :unprocessable_entity
  end

  test "PATCH create if place parameters are invalid, place is not updated" do
    place = @places.sample

    place_payload = { place: { name: nil } }

    assert_no_changes -> { place.reload.name } do
      patch wedding_place_path(@wedding, place, **place_payload, format: :turbo_stream)
    end
  end

  test "DELETE destroy if place parameter is valid, returns ok status code" do
    place = @places.sample

    delete wedding_place_path(@wedding, place, format: :turbo_stream)

    assert_response :ok
  end

  test "DELETE destroy if place parameter is valid, removes place" do
    place = @places.sample

    assert_difference -> { @wedding.reload.places.count }, -1 do
      delete wedding_place_path(@wedding, place, format: :turbo_stream)
    end

    assert_not Place.exists?(place.id)
  end

  test "DELETE destroy if place cannot be removed, returns unprocessable entity response" do
    place = @places.sample

    Place.any_instance.stubs(:destroy).returns(false)

    delete wedding_place_path(@wedding, place, format: :turbo_stream)

    assert_response :unprocessable_entity
  end

  test "DELETE destroy if place cannot be removed, does not remove place" do
    place = @places.sample

    Place.any_instance.stubs(:destroy).returns(false)

    assert_no_difference -> { @wedding.reload.places.count } do
      delete wedding_place_path(@wedding, place, format: :turbo_stream)
    end

    assert Place.exists?(place.id)
  end
end
