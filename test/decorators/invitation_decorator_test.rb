# frozen_string_literal: true

require "test_helper"

class InvitationDecoratorTest < ActiveSupport::TestCase
  setup do
    @wedding = FactoryBot.create(:wedding)
    @guests = [
      FactoryBot.create(:guest, name: "John", surname: "Doe", wedding: @wedding),
      FactoryBot.create(:guest, name: "Jane", surname: "Doe", wedding: @wedding),
      FactoryBot.create(:guest, name: "Jack", surname: "Doe", wedding: @wedding)
    ]
  end

  test "#guest_names if invitation has one guest,
                returns guest full name" do
    invitation = FactoryBot.create(:invitation, wedding: @wedding, guests: [@guests[0]])
    invitation_decorator = InvitationDecorator.new(invitation)

    assert_equal "John Doe", invitation_decorator.guest_names
  end

  test "#guest_names if invitation has two guest,
                returns guests' full name joint by &" do
    invitation = FactoryBot.create(:invitation, wedding: @wedding, guests: @guests[0..1])
    invitation_decorator = InvitationDecorator.new(invitation)

    assert_equal "John Doe & Jane Doe", invitation_decorator.guest_names
  end

  test "#guest_names if invitation more than two guest,
                returns guests' full name joint by commas, except last ones, joint by &" do
    invitation = FactoryBot.create(:invitation, wedding: @wedding, guests: @guests)
    invitation_decorator = InvitationDecorator.new(invitation)

    assert_equal "John Doe, Jane Doe & Jack Doe", invitation_decorator.guest_names
  end
end

