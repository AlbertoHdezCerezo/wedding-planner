# frozen_string_literal: true

class Invitations::ShowComponentPreview < ViewComponent::Preview
  def default
    render(Invitations::ShowComponent.new)
  end
end
