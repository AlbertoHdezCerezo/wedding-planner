# frozen_string_literal: true

require "test_helper"

class InvitationStateTransitionTest < ActiveSupport::TestCase
  # Validations
  test "validates invitation presence" do
    invitation_state_transition = InvitationStateTransition.new(invitation: nil, event: "accept")

    assert_not invitation_state_transition.valid?
    assert invitation_state_transition.errors.of_kind?(:invitation, :blank)
  end

  test "validates event presence" do
    invitation_state_transition = InvitationStateTransition.new(invitation: FactoryBot.build(:invitation), event: nil)

    assert_not invitation_state_transition.valid?
    assert invitation_state_transition.errors.of_kind?(:event, :blank)
  end

  test "if event is present, validates event is registered" do
    invitation_state_transition = InvitationStateTransition.new(
      invitation: FactoryBot.build(:invitation),
      event: "unregistered_event"
    )

    assert_not invitation_state_transition.valid?
    assert invitation_state_transition.errors.of_kind?(:event, :not_defined)
  end

  test "if invitation cannot process event in current state, validates event incompatibility with state" do
    invitation_state_transition = InvitationStateTransition.new(
      invitation: FactoryBot.build(:invitation, state: :pending),
      event: "unregistered_event"
    )

    assert_not invitation_state_transition.valid?
    assert invitation_state_transition.errors.of_kind?(:event, :incompatible_with_invitation_state)
  end

  test "#save if invitation state transition is valid, transitions invitation state with given event" do
    guest = FactoryBot.create(:guest)
    invitation = FactoryBot.create(:invitation, wedding: guest.wedding, guests: [guest], state: :pending)
    invitation_state_transition = InvitationStateTransition.new(invitation:, event: :deliver)

    assert_changes -> { invitation.reload.state }, to: "sent" do
      assert invitation_state_transition.save
    end
  end

  test "#save if invitation state transition is invalid, invitation state does not change" do
    guest = FactoryBot.create(:guest)
    invitation = FactoryBot.create(:invitation, wedding: guest.wedding, guests: [guest], state: :pending)
    invitation_state_transition = InvitationStateTransition.new(invitation:, event: :invalid_event)

    assert_no_changes -> { invitation.reload.state } do
      assert_not invitation_state_transition.save
    end
  end
end
