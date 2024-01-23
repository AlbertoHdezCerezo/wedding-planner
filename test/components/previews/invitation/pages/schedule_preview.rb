# frozen_string_literal: true

class Invitation::Pages::SchedulePreview < ViewComponent::Preview
  def default
    wedding = Invitation::ShowComponentPreview.wedding
    guest = FactoryBot.build(:guest)
    render(Invitation::Pages::Schedule.new(wedding:, guest:))
  end
end
