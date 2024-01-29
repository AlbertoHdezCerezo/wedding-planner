# frozen_string_literal: true

class Invitation::EnvelopPreview < ViewComponent::Preview
  def default
    wedding = Invitation::ShowComponentPreview.wedding
    guest = wedding.guests.first
    invitation = FactoryBot.build(:invitation, wedding:, guests: [guest])
    render(Invitation::Envelop.new(invitation:))
  end
end
