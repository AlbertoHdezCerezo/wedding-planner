# frozen_string_literal: true

class Invitation::Invitation::ShowComponentPreview < ViewComponent::Preview
  def default
    wedding = FactoryBot.build(:wedding)
    guest = FactoryBot.build(:guest)
    render(Invitation::Invitation::ShowComponent.new(wedding:, guest:))
  end
end
