# frozen_string_literal: true

class Weddings::IndexComponentPreview < ViewComponent::Preview
  def default
    render(Weddings::IndexComponent.new)
  end
end
