# frozen_string_literal: true

require "controller_test_helper"

class SchedulesControllerTest < ControllerTestHelper
  setup do
    @wedding = FactoryBot.create(:wedding)
  end

  test "GET show renders schedule page" do
    get wedding_schedule_path(@wedding)

    assert_response :success
  end

  test "GET index fetches wedding" do
    get wedding_schedule_path(@wedding)

    wedding = assigns(:wedding)

    assert_equal wedding, @wedding
  end

  test "GET index fetches wedding guests" do
    raise "Complete test once logic to fetch events is ready"
  end
end
