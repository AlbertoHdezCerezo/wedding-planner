# frozen_string_literal: true

class Events::EventComponentPreview < ViewComponent::Preview
  def default
    event = FactoryBot.build(:event)
    render Events::EventComponent.new(event:)
  end
end
