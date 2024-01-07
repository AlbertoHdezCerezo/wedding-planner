# frozen_string_literal: true

class Invitation::Pages::MenuPreview < ViewComponent::Preview
  def default
    wedding = FactoryBot.build(:wedding)
    guest = FactoryBot.build(:guest)
    render(Invitation::Pages::Menu.new(wedding:, guest:))
  end
end
