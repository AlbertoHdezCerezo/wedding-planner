# frozen_string_literal: true

# @label Horizontal Description List Component
class Common::HorizontalDescriptionListComponentPreview < ViewComponent::Preview
  def with_textual_terms
    render Common::HorizontalDescriptionListComponent.new(separator: "·") do |list|
      list.with_text_field(field_name: "Term 1", field_description: "Description 1")
      list.with_text_field(field_name: "Term 2", field_description: "Description 2")
      list.with_text_field(field_name: "Term 3", field_description: "Description 3")
    end
  end

  def with_icon_terms
    render Common::HorizontalDescriptionListComponent.new(separator: "·") do |list|
      list.with_icon_field(field_icon: "globe", field_description: "Plasencia, Spain")
      list.with_icon_field(field_icon: "calendar", field_description: "18-11-2023 (10 days left)")
    end
  end
end
