# frozen_string_literal: true

require "test_helper"
require "aasm/minitest"

class InvitationTest < ActiveSupport::TestCase
  # Validations
  test "validates invitation belongs to wedding" do
    invitation = FactoryBot.create(:invitation)
    invitation.wedding = nil

    assert_not invitation.valid?, "Expected invitation without wedding to be invalid. Invitation is valid"
  end

  test "validates invitation has at least one guest" do
    invitation = FactoryBot.build(:invitation)
    invitation.guests = []

    assert_not invitation.valid?, "Expected invitation without guests to be invalid. Invitation is valid"
    assert invitation.errors.of_kind?(:guests, :too_short)
  end

  test "validates invitation guests are in wedding guests list" do
    invitation = FactoryBot.build(:invitation)
    guest = FactoryBot.create(:guest)
    invitation.guests = [guest]

    assert_not invitation.valid?, <<-SQL.squish
      Expected invitation with guest not in wedding guests list to be invalid. Invitation is valid"
    SQL
    assert invitation.errors.of_kind?(:guests, :guest_not_invited_to_wedding)
  end

  # State Machine Transitions
  test "by default an invitation state is pending" do
    invitation = FactoryBot.create(:invitation)

    assert_predicate invitation, :pending?, <<-MESSAGE
      Expected new invitation to have pending state by default. Invitation has #{invitation.state} state
    MESSAGE
  end

  test "a pending invitation transitions to delivered state with deliver event" do
    invitation = FactoryBot.create(:invitation)

    assert_transitions_from invitation, :pending, to: :delivered, on_event: :deliver
  end

  test "a delivered invitation transitions to opened state with open event" do
    invitation = FactoryBot.create(:invitation)
    invitation.deliver!

    assert_transitions_from invitation, :delivered, to: :opened, on_event: :open
  end

  test "an opened invitation transitions to accepted state with accept event" do
    invitation = FactoryBot.create(:invitation)
    invitation.deliver!
    invitation.open!

    assert_transitions_from invitation, :opened, to: :accepted, on_event: :accept
  end

  test "an opened invitation transitions to declined state with decline event" do
    invitation = FactoryBot.create(:invitation)
    invitation.deliver!
    invitation.open!

    assert_transitions_from invitation, :opened, to: :declined, on_event: :decline
  end

  test "an accepted invitation transitions to cancelled state with cancel event" do
    invitation = FactoryBot.create(:invitation)
    invitation.deliver!
    invitation.open!
    invitation.accept!

    assert_transitions_from invitation, :accepted, to: :cancelled, on_event: :cancel
  end
end
