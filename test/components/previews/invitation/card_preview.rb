# frozen_string_literal: true

class Invitation::CardPreview < ViewComponent::Preview
  def default
    wedding = FactoryBot.build(:wedding)
    guest = FactoryBot.build(:guest)
    render(Invitation::Card.new(wedding:, guest:))
  end
end
