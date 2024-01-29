# frozen_string_literal: true

class Invitation::Pages::CoverPreview < ViewComponent::Preview
  def default
    wedding = Invitation::ShowComponentPreview.wedding
    guest = wedding.guests.first
    invitation = FactoryBot.build(:invitation, wedding:, guests: [guest])
    render(Invitation::Pages::Cover.new(invitation:))
  end
end
