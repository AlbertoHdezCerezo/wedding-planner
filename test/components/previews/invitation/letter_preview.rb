# frozen_string_literal: true

class Invitation::LetterPreview < ViewComponent::Preview
  layout "application"

  def default
    wedding = Invitation::ShowComponentPreview.wedding
    guest = wedding.guests.first
    invitation = FactoryBot.build(:invitation, wedding:, guests: [guest])
    render(Invitation::Letter.new(invitation:))
  end
end
