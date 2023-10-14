# frozen_string_literal: true

class Layout::PageComponentPreview < ViewComponent::Preview
  def default
    render(Layout::PageComponent.new)
  end
end
