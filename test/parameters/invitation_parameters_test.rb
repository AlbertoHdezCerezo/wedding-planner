# frozen_string_literal: true

require "test_helper"

class InvitationParametersTest < ActiveSupport::TestCase
  test "parses wedding permitted parameters" do
    params = ActionController::Parameters.new(permitted_parameters)

    parsed_params = InvitationParameters.new(params)

    assert_equal permitted_parameters.keys, parsed_params.keys
  end

  test "filters wedding unpermitted parameters" do
    params = ActionController::Parameters.new(unpermitted_parameters)

    parsed_params = InvitationParameters.new(params)

    assert_empty parsed_params
  end

  private

  def permitted_parameters
    {
      guest_ids: %i[one two three]
    }
  end

  def unpermitted_parameters
    {
      unpermitted_parameter: false,
      other_unpermitted_parameter: false
    }
  end
end
