# frozen_string_literal: true

class GuestsList::ShowComponentPreview < ViewComponent::Preview
  def default
    render(GuestsList::ShowComponent.new(wedding: nil, guests: []))
  end
end
