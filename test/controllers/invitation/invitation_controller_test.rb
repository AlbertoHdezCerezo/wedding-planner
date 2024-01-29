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
end
