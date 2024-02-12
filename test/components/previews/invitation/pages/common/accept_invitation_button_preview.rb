# frozen_string_literal: true

class Invitation::Pages::Common::AcceptInvitationButtonPreview < ViewComponent::Preview
  def default
    wedding = Invitation::ShowComponentPreview.wedding
    guest = wedding.guests.first
    invitation = FactoryBot.build(:invitation, wedding:, guests: [guest])
    render(Invitation::Pages::Common::AcceptInvitationButton.new(invitation:, preview_mode: true))
  end
end
