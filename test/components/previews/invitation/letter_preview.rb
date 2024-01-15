# frozen_string_literal: true

class Invitation::LetterPreview < ViewComponent::Preview
  def default
    wedding = FactoryBot.build(:wedding)
    guest = FactoryBot.build(:guest)
    render(Invitation::Letter.new(wedding:, guest:))
  end
end
