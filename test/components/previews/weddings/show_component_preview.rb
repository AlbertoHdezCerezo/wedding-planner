# frozen_string_literal: true

class Weddings::ShowComponentPreview < ViewComponent::Preview
  def default
    render(Weddings::ShowComponent.new(wedding: nil))
  end
end
