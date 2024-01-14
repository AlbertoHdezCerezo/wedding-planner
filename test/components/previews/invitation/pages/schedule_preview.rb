# frozen_string_literal: true

class Invitation::Pages::SchedulePreview < ViewComponent::Preview
  def default
    wedding = FactoryBot.build(:wedding)
    wedding.events = FactoryBot.build_list(:event, 3, wedding:)
    guest = FactoryBot.build(:guest)
    render(Invitation::Pages::Schedule.new(wedding:, guest:))
  end
end
