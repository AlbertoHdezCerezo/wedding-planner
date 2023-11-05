# frozen_string_literal: true

# @label Action List Component
class Common::ActionListComponentPreview < ViewComponent::Preview
  # Action List Component
  # --------------
  # List of actions. Can be used for multiple purposes:
  # - Sidebar navigation.
  # - Dropdown menues, select menues.
  # - And any other sort of lists with actionable text items in it.
  def default # rubocop:disable Metrics/AbcSize
    render Common::ActionListComponent.new do |list|
      list.with_heading(title: "Title")
      list.with_item_default(label: "item 1")
      list.with_item_default(label: "item 2")
      list.with_item_default(label: "item 3")

      list.with_item_divider

      list.with_item_default(label: "with leading visual") do |item|
        item.with_leading_visual_icon(icon: "arrow-left")
      end
      list.with_item_default(label: "with trailing visual") do |item|
        item.with_trailing_visual_icon(icon: "box-pencil")
      end
      list.with_item_default(label: "with leading and trailing visual") do |item|
        item.with_leading_visual_icon(icon: "arrow-left")
        item.with_trailing_visual_icon(icon: "box-pencil")
      end

      list.with_item_divider

      list.with_item_default(label: "active item", active: true)
      list.with_item_default(label: "disabled item", disabled: true)
      list.with_item_default(label: "active & disabled item", active: true, disabled: true)
    end
  end

  # @param size select { choices: [base, lg] }
  def playground(size: :base) # rubocop:disable Metrics/AbcSize
    render Common::ActionListComponent.new(size:) do |list|
      list.with_heading(title: "Title")
      list.with_item_default(label: "item 1")
      list.with_item_default(label: "item 2")
      list.with_item_default(label: "item 3")

      list.with_item_divider

      list.with_item_default(label: "with leading visual") do |item|
        item.with_leading_visual_icon(icon: "arrow-left")
      end
      list.with_item_default(label: "with trailing visual") do |item|
        item.with_trailing_visual_icon(icon: "box-pencil")
      end
      list.with_item_default(label: "with leading and trailing visual") do |item|
        item.with_leading_visual_icon(icon: "arrow-left")
        item.with_trailing_visual_icon(icon: "box-pencil")
      end

      list.with_item_divider

      list.with_item_default(label: "active item", active: true)
      list.with_item_default(label: "disabled item", disabled: true)
      list.with_item_default(label: "active & disabled item", active: true, disabled: true)
    end
  end
end
