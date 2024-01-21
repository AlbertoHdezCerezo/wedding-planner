# frozen_string_literal: true

require "test_helper"

class AddressParametersTest < ActiveSupport::TestCase
  test "parses address permitted parameters" do
    params = ActionController::Parameters.new(permitted_parameters)

    parsed_params = AddressParameters.new(params)

    assert_equal permitted_parameters.keys.sort, parsed_params.keys.sort
  end

  test "filters address unpermitted parameters" do
    params = ActionController::Parameters.new(unpermitted_parameters)

    parsed_params = AddressParameters.new(params)

    assert_empty parsed_params
  end

  private

  def permitted_parameters
    {
      street: "Calle de la Princesa",
      number: "7",
      zip_code: "10600",
      town: "Plasencia",
      state: "Cáceres",
      country: "Spain"
    }
  end

  def unpermitted_parameters
    {
      unpermitted_parameter: false,
      other_unpermitted_parameter: false
    }
  end
end
