# frozen_string_literal: true

require "test_helper"

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
end
