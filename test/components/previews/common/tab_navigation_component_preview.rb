# frozen_string_literal: true

# @label Tab Navigation Component
class Common::TabNavigationComponentPreview < ViewComponent::Preview
  def default
    render(Common::TabNavigationComponent.new) do |navigation|
      navigation.with_item("/", "Item 1", active: true)
      navigation.with_item("/", "Item 2")
      navigation.with_item("/", "Item 3")
      navigation.with_item("/", "Item 4")

      content_tag(:p, "Navigation Body", class: "h-[400px] w-[600px] flex items-center justify-center")
    end
  end
end
