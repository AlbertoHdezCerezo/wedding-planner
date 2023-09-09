# frozen_string_literal: true

class Examples::WithControllerComponentPreview < ViewComponent::Preview
  def default = render(Examples::WithControllerComponent.new)
end
