# frozen_string_literal: true

class Invitation::Layout::PageComponentPreview < ViewComponent::Preview
  def default
    render(Invitation::Layout::PageComponent.new)
  end
end
