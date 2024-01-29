# frozen_string_literal: true

class Invitation::Pages::WelcomePreview < ViewComponent::Preview
  def default
    wedding = Invitation::ShowComponentPreview.wedding
    guest = wedding.guests.first
    invitation = FactoryBot.build(:invitation, wedding:, guests: [guest])
    render(Invitation::Pages::Welcome.new(invitation:))
  end
end
