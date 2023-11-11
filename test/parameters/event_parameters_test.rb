# frozen_string_literal: true

require "test_helper"

class EventParametersTest < ActiveSupport::TestCase
  test "parses event permitted parameters" do
    params = ActionController::Parameters.new(permitted_parameters)

    parsed_params = GuestParameters.new(params)

    assert_equal permitted_parameters, parsed_params
  end

  test "filters guest unpermitted parameters" do
    params = ActionController::Parameters.new(unpermitted_parameters)

    parsed_params = GuestParameters.new(params)

    assert_empty parsed_params
  end

  private

  def permitted_parameters
    {
      name: "Andrea",
      surname: "Munoz",
      country: "Germany"
    }
  end

  def unpermitted_parameters
    {
      unpermitted_parameter: false,
      other_unpermitted_parameter: false
    }
  end
end
