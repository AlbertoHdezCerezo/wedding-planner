# frozen_string_literal: true

class Invitation::Pages::LocationPreview < ViewComponent::Preview
  def default
    wedding = Invitation::ShowComponentPreview.wedding
    guest = wedding.guests.first
    invitation = FactoryBot.build(:invitation, wedding:, guests: [guest])
    render(Invitation::Pages::Location.new(invitation:))
  end
end
