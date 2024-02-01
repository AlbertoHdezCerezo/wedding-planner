# frozen_string_literal: true

require "test_helper"

class InvitationStateTransitionParametersTest < ActiveSupport::TestCase
  test "parses invitation state transition permitted parameters" do
    params = ActionController::Parameters.new(permitted_parameters)

    parsed_params = InvitationStateTransitionParameters.new(params)

    assert_equal permitted_parameters.keys, parsed_params.keys
  end

  test "filters invitation state transition unpermitted parameters" do
    params = ActionController::Parameters.new(unpermitted_parameters)

    parsed_params = InvitationStateTransitionParameters.new(params)

    assert_empty parsed_params
  end

  private

  def permitted_parameters
    {
      invitation_id: "invitation_id",
      event: "open"
    }
  end

  def unpermitted_parameters
    {
      unpermitted_parameter: false,
      other_unpermitted_parameter: false
    }
  end
end
