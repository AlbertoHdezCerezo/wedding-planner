# frozen_string_literal: true

require "test_helper"

class InvitationTest < ActiveSupport::TestCase
  # Constraints
  test "an invitation must belong to a wedding" do
    invitation = FactoryBot.create(:invitation)
    invitation.wedding = nil

    assert_not invitation.valid?, "Expected invitation without wedding to be invalid. Invitation is valid"
  end
end
