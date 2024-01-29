# frozen_string_literal: true

class Invitation::Pages::SchedulePreview < ViewComponent::Preview
  def default
    wedding = Invitation::ShowComponentPreview.wedding
    guest = wedding.guests.first
    invitation = FactoryBot.build(:invitation, wedding:, guests: [guest])
    render(Invitation::Pages::Schedule.new(invitation:))
  end
end
