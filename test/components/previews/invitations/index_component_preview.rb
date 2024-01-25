# frozen_string_literal: true

class Invitations::IndexComponentPreview < ViewComponent::Preview
  def default
    guest = Guest.first || FactoryBot.create(:guest)
    wedding = guest.wedding
    invitation = Invitation.first || FactoryBot.create(:invitation, wedding:, guests: [guest])
    render_with_template(locals: { wedding:, invitation: })
  end
end
