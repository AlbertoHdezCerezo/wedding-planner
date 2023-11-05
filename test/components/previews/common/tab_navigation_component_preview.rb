# frozen_string_literal: true

# @label Tab Navigation Component
class Common::TabNavigationComponentPreview < ViewComponent::Preview
  def default
    render(Common::TabNavigationComponent.new(url: "/item1")) do |navigation|
      navigation.with_item("/item1", "Item 1")
      navigation.with_item("/item2", "Item 2")
      navigation.with_item("/item3", "Item 3")
      navigation.with_item("/item4", "Item 4")

      content_tag(:p, "Navigation Body", class: "h-[400px] w-[600px] flex items-center justify-center")
    end
  end

  # @param url text
  def playground(url: "/item1")
    render(Common::TabNavigationComponent.new(url:)) do |navigation|
      navigation.with_item("/item1", "Item 1")
      navigation.with_item("/item2", "Item 2")
      navigation.with_item("/item3", "Item 3")
      navigation.with_item("/item4", "Item 4")

      content_tag(:p, "Navigation Body", class: "h-[400px] w-[600px] flex items-center justify-center")
    end
  end
end
