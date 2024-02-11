# frozen_string_literal: true

require "minitest/autorun"
require "controller_test_helper"

class InvitationsControllerTest < ControllerTestHelper # rubocop:todo Metrics/ClassLength
  setup do
    @wedding = FactoryBot.create(:wedding)
    @guests = FactoryBot.create_list(:guest, 3, wedding: @wedding)
    @invitations = [
      FactoryBot.create(:invitation, wedding: @wedding, language: "en", guests: [@guests.first]),
      FactoryBot.create(:invitation, wedding: @wedding, language: "en", guests: [@guests.second]),
      FactoryBot.create(:invitation, wedding: @wedding, language: "en", guests: [@guests.last])
    ]
  end

  test "GET index renders invitation page" do
    get wedding_invitations_path(@wedding)

    assert_response :success
  end

  test "GET index fetches wedding" do
    get wedding_invitations_path(@wedding)

    wedding = assigns(:wedding)

    assert_equal wedding, @wedding
  end

  test "GET index fetches wedding invitations" do
    get wedding_invitations_path(@wedding)

    invitations = assigns(:invitations)

    assert_equal invitations.sort, @invitations.sort
  end

  test "GET new renders invitation form" do
    get new_wedding_invitation_path(@wedding)

    assert_response :success
  end

  test "GET new assigns new invitation" do
    get new_wedding_invitation_path(@wedding)

    invitation = assigns(:invitation)

    assert_predicate invitation, :new_record?
  end

  test "POST create if invitation parameters are valid, renders event template" do
    invitation_payload = { invitation: { guest_ids: @guests.pluck(:id) } }

    post wedding_invitations_path(@wedding, **invitation_payload, format: :turbo_stream)

    assert_response :created
  end

  test "POST create if invitation parameters are valid, creates new wedding invitation" do
    invitation_payload = { invitation: { guest_ids: @guests.pluck(:id) } }

    assert_difference -> { @wedding.invitations.reload.count }, 1 do
      post wedding_invitations_path(@wedding, **invitation_payload, format: :turbo_stream)
    end
  end

  test "POST create if invitation parameters are invalid, return unprocessable entity response" do
    invitation_payload = { invitation: { invalid_parameter: true } }

    post wedding_invitations_path(@wedding, **invitation_payload, format: :turbo_stream)

    assert_response :unprocessable_entity
  end

  test "POST create if invitation parameters are invalid, no invitation is created" do
    invitation_payload = { invitation: { invalid_parameter: true } }

    assert_no_difference -> { @wedding.invitations.reload.count } do
      post wedding_invitations_path(@wedding, **invitation_payload, format: :turbo_stream)
    end
  end

  test "GET edit renders invitation form" do
    invitation = @invitations.sample

    get edit_wedding_invitation_path(@wedding, invitation)

    assert_response :success
  end

  test "GET edit assigns specified invitation" do
    invitation = @invitations.sample

    get edit_wedding_invitation_path(@wedding, invitation)

    response_invitation = assigns(:invitation)

    assert_equal response_invitation, invitation
  end

  test "PATCH update if invitation parameters are valid, redirects to invitations path" do
    invitation = @invitations.sample

    invitation_payload = { invitation: { guest_ids: @guests.pluck(:id) } }

    patch wedding_invitation_path(@wedding, invitation, **invitation_payload, format: :turbo_stream)

    assert_response :ok
  end

  test "PATCH update if invitation parameters are valid, update invitation" do
    invitation = @invitations.last

    invitation_payload = { invitation: { guest_ids: [@guests.first.id] } }

    assert_changes -> { invitation.reload.guest_ids }, to: [@guests.first.id] do
      patch wedding_invitation_path(@wedding, invitation, **invitation_payload, format: :turbo_stream)
    end
  end

  test "PATCH create if invitation parameters are invalid, return unprocessable entity response" do
    invitation = @invitations.sample

    invitation_payload = { invitation: { guest_ids: nil } }

    patch wedding_invitation_path(@wedding, invitation, **invitation_payload, format: :turbo_stream)

    assert_response :unprocessable_entity
  end

  test "PATCH create if invitation parameters are invalid, invitation is not updated" do
    invitation = @invitations.sample

    invitation_payload = { invitation: { guest_ids: nil } }

    assert_no_changes -> { invitation.reload.guest_ids } do
      patch wedding_invitation_path(@wedding, invitation, **invitation_payload, format: :turbo_stream)
    end
  end

  test "DELETE destroy if invitation parameter is valid, returns ok status code" do
    invitation = @invitations.sample

    delete wedding_invitation_path(@wedding, invitation, format: :turbo_stream)

    assert_response :ok
  end

  test "DELETE destroy if invitation parameter is valid, removes invitation" do
    invitation = @invitations.sample

    assert_difference -> { @wedding.reload.invitations.count }, -1 do
      delete wedding_invitation_path(@wedding, invitation, format: :turbo_stream)
    end

    assert_not Invitation.exists?(invitation.id)
  end

  test "DELETE destroy if invitation cannot be removed, returns unprocessable entity response" do
    invitation = @invitations.sample

    Invitation.any_instance.stubs(:destroy).returns(false)

    delete wedding_invitation_path(@wedding, invitation, format: :turbo_stream)

    assert_response :unprocessable_entity
  end

  test "DELETE destroy if invitation cannot be removed, does not remove invitation" do
    invitation = @invitations.sample

    Invitation.any_instance.stubs(:destroy).returns(false)

    assert_no_difference -> { @wedding.reload.invitations.count } do
      delete wedding_invitation_path(@wedding, invitation, format: :turbo_stream)
    end

    assert Invitation.exists?(invitation.id)
  end
end
