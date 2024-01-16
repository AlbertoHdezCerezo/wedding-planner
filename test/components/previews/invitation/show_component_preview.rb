# frozen_string_literal: true

class Invitation::ShowComponentPreview < ViewComponent::Preview
  layout "application"

  def default
    wedding = FactoryBot.build(:wedding)
    guest = FactoryBot.build(:guest)
    render(Invitation::ShowComponent.new(wedding:, guest:))
  end
end
