# frozen_string_literal: true

class Invitation::Pages::WelcomePreview < ViewComponent::Preview
  def default
    wedding = FactoryBot.build(:wedding)
    guest = FactoryBot.build(:guest)
    render(Invitation::Pages::Welcome.new(wedding:, guest:))
  end
end
