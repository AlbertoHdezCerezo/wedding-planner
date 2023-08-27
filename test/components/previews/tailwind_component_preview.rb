# frozen_string_literal: true

class TailwindComponentPreview < ViewComponent::Preview
  def default = render(TailwindPreviewComponent.new)
end
