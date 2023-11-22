# frozen_string_literal: true

require "test_helper"

class EventParametersTest < ActiveSupport::TestCase
  test "parses event permitted parameters" do
    params = ActionController::Parameters.new(permitted_parameters)

    parsed_params = EventParameters.new(params)

    expected_params = permitted_parameters
                      .merge(schedule: permitted_parameters[:start_time]..permitted_parameters[:end_time])
                      .except(:start_time, :end_time)

    assert_equal parsed_params, expected_params
  end

  test "filters guest unpermitted parameters" do
    params = ActionController::Parameters.new(unpermitted_parameters)

    parsed_params = GuestParameters.new(params)

    assert_empty parsed_params
  end

  private

  def permitted_parameters
    timestamp = Time.new(2023, 11, 11, 11, 11)

    {
      name: "My Event",
      description: "This is a description for my event",
      start_time: timestamp,
      end_time: timestamp.since(1)
    }
  end

  def unpermitted_parameters
    {
      unpermitted_parameter: false,
      other_unpermitted_parameter: false
    }
  end
end
