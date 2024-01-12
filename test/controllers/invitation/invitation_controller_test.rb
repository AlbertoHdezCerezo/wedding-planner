# frozen_string_literal: true

require "minitest/autorun"
require "controller_test_helper"

class Invitation::InvitationControllerTest < ControllerTestHelper
  setup do
    @wedding = FactoryBot.create(:wedding)
    @guest = FactoryBot.create(:guest, wedding: @wedding)
  end

  test "GET show renders guest invitation" do
    get wedding_guest_invitation_path(@wedding, @guest)

    assert_response :success
  end
end
