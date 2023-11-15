# frozen_string_literal: true

# @label Dropdown Component
class Common::DropdownComponentPreview < ViewComponent::Preview
  def default
    render Common::DropdownComponent.new
  end
end
