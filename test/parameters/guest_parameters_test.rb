# frozen_string_literal: true

require "test_helper"

class GuestParametersTest < ActiveSupport::TestCase
  test "parses guest permitted parameters" do
    params = ActionController::Parameters.new(permitted_parameters)

    parsed_params = EventParameters.new(params)

    schedule = permitted_parameters[:start_time]..permitted_parameters[:end_time]
    expected_parameters = permitted_parameters.merge(schedule:)

    assert_equal expected_parameters, parsed_params
  end

  test "if permitted parameters do not include start time,
              resulting parameters do not include schedule parameter" do
    params = ActionController::Parameters.new(
      {
        name: "Gala Dinner",
        description: "Dinner for all guests in the Gala event",
        end_time: Time.current.to_s,
      }
    )

    parsed_params = EventParameters.new(params)

    assert_nil parsed_params[:schedule]
  end

  test "if permitted parameters do not include end time,
              resulting parameters do not include schedule parameter" do
    params = ActionController::Parameters.new(
      {
        name: "Gala Dinner",
        description: "Dinner for all guests in the Gala event",
        start_time: Time.current.to_s,
      }
    )

    parsed_params = EventParameters.new(params)

    assert_nil parsed_params[:schedule]
  end

  test "filters guest unpermitted parameters" do
    params = ActionController::Parameters.new(unpermitted_parameters)

    parsed_params = EventParameters.new(params)

    assert_empty parsed_params
  end

  private

  def permitted_parameters
    {
      name: "Gala Dinner",
      description: "Dinner for all guests in the Gala event",
      start_time: Time.current.to_s,
      end_time: Time.current.since(2).to_s
    }
  end

  def unpermitted_parameters
    {
      unpermitted_parameter: false,
      other_unpermitted_parameter: false
    }
  end
end
