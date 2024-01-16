# frozen_string_literal: true

class Invitation::EnvelopPreview < ViewComponent::Preview
  layout "application"

  def default
    wedding = FactoryBot.build(:wedding)
    guest = FactoryBot.build(:guest)
    render(Invitation::Envelop.new(wedding:, guest:))
  end
end
