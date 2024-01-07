# frozen_string_literal: true

class Invitation::Pages::CoverPreview < ViewComponent::Preview
  def default
    wedding = FactoryBot.build(:wedding)
    guest = FactoryBot.build(:guest)
    render(Invitation::Pages::Cover.new(wedding:, guest:))
  end
end
