# frozen_string_literal: true

class Schedule::ShowComponentPreview < ViewComponent::Preview
  def default
    wedding = FactoryBot.create(:wedding)

    render Schedule::ShowComponent.new(wedding:, schedule: nil)
  end
end
