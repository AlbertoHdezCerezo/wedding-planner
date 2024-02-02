# frozen_string_literal: true

require "minitest/autorun"
require "controller_test_helper"

class Invitation::InvitationControllerTest < ControllerTestHelper
  setup do
    wedding = FactoryBot.create(:wedding)
    guest = FactoryBot.create(:guest, wedding:)
    @invitation = FactoryBot.create(:invitation, wedding:, guests: [guest])
  end

  test "GET show renders guest invitation" do
    get invitation_path(@invitation)

    assert_response :success
  end

  test "GET show fetches invitation" do
    get invitation_path(@invitation)

    invitation = assigns(:invitation)

    assert_equal @invitation, invitation
  end

  test "GET show if invitation is pending and preview mode is disabled, opens invitation" do
    assert_predicate @invitation, :pending?

    assert_changes -> { @invitation.reload.opened? }, to: true do
      get invitation_path(@invitation)
    end
  end

  test "GET show if invitation is delivered and preview mode is disabled, opens invitation" do
    @invitation.deliver!

    assert_predicate @invitation, :delivered?

    assert_changes -> { @invitation.reload.opened? }, to: true do
      get invitation_path(@invitation)
    end
  end

  test "GET show if invitation is not opened and preview mode is enabled, does not open invitation" do
    assert_predicate @invitation, :pending?

    assert_no_changes -> { @invitation.reload.opened? } do
      get invitation_path(@invitation, preview_mode: true)
    end
  end
end
