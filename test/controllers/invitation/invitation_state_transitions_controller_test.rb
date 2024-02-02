# frozen_string_literal: true

require "minitest/autorun"
require "controller_test_helper"

class Invitation::InvitationStateTransitionsControllerTest < ControllerTestHelper
  setup do
    wedding = FactoryBot.create(:wedding)
    guest = FactoryBot.create(:guest, wedding:)
    @invitation = FactoryBot.create(:invitation, wedding:, guests: [guest])
  end

  test "POST if invitation state parameters are valid, create updates invitation state" do
    invitation_state_transition_payload = {
      invitation_state_transition: {
        event: "deliver",
        invitation_id: @invitation.id
      }
    }

    assert_changes -> { @invitation.reload.delivered? }, to: true do
      post invitation_state_transition_path(**invitation_state_transition_payload, format: :json)
    end
  end

  test "POST if invitation state parameters are valid, returns success response" do
    invitation_state_transition_payload = {
      invitation_state_transition: {
        event: "deliver",
        invitation_id: @invitation.id
      }
    }

    post invitation_state_transition_path(**invitation_state_transition_payload, format: :json)

    assert_response :success
  end

  test "POST if invitation state parameters are invalid, does not update invitation state" do
    invitation_state_transition_payload = {
      invitation_state_transition: {
        event: "invalid_event",
        invitation_id: @invitation.id
      }
    }

    assert_no_changes -> { @invitation.reload.delivered? } do
      post invitation_state_transition_path(**invitation_state_transition_payload, format: :json)
    end
  end

  test "POST if invitation state parameters are invalid, returns unprocessable entity" do
    invitation_state_transition_payload = {
      invitation_state_transition: {
        event: "invalid_event",
        invitation_id: @invitation.id
      }
    }

    post invitation_state_transition_path(**invitation_state_transition_payload, format: :json)

    assert_response :unprocessable_entity
  end
end
